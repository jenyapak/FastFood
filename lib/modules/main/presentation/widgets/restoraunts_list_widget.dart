import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/base/base_state.dart';
import 'package:fast_food/core/config/router.gr.dart';
import 'package:fast_food/core/constants/app_paddings.dart';
import 'package:fast_food/core/extensions/int_extension.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:fast_food/main.dart';
import 'package:fast_food/modules/main/domain/entity/restourant_entity.dart';
import 'package:fast_food/modules/main/presentation/cubit/get_restaurants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestorauntsListWidget extends StatefulWidget {
  const RestorauntsListWidget({super.key});

  @override
  State<RestorauntsListWidget> createState() => _RestorauntsListWidgetState();
}

class _RestorauntsListWidgetState extends State<RestorauntsListWidget> {
  final _getRestaurantsCubit = di<GetRestaurantsCubit>()..getRestaurants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF4B3A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: AppPaddings.medium.horizontal,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for restoraunts',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          AppPaddings.large.verticalSpace,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: AppPaddings.medium.toDouble()),
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: BlocProvider.value(
                value: _getRestaurantsCubit,
                child:
                    BlocBuilder<
                      GetRestaurantsCubit,
                      BaseState<List<RestaurantEntity>>
                    >(
                      builder: (context, state) {
                        if (state.status == StateStatus.error) {
                          return Center(child: Text(state.message ?? 'Error'));
                        }
                        if (state.status == StateStatus.loading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state.status == StateStatus.success) {
                          if (state.model?.isEmpty ?? false) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('List is empty '),
                                ElevatedButton(
                                  onPressed: () {
                                    _getRestaurantsCubit.getRestaurants();
                                  },
                                  child: Text('Retry'),
                                ),
                              ],
                            );
                          }
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                AppPaddings.medium.verticalSpace,
                            padding: AppPaddings.medium.all,
                            itemCount: state.model?.length ?? 0,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    FoodsRoute(
                                      restaurantId:
                                          state.model?[index].id.toString() ??
                                          '',
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: SizedBox(
                                        height: 150,
                                        width: double.infinity,
                                        child: Image.network(
                                          state.model?[index].image ?? '',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.2,
                                            ),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsGeometry.symmetric(
                                          horizontal: AppPaddings.huge
                                              .toDouble(),
                                          vertical: AppPaddings.medium
                                              .toDouble(),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.model?[index].name ??
                                                      '',
                                                  style: AppTextStyle.bold
                                                      .setSize(16),
                                                ),
                                                Text(
                                                  state
                                                          .model?[index]
                                                          .description ??
                                                      '',
                                                  style: AppTextStyle.regular
                                                      .setSize(14)
                                                      .copyWith(
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: AppPaddings.small.all,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    state.model?[index].rating
                                                            .toString() ??
                                                        '',
                                                    style: AppTextStyle.bold
                                                        .setSize(16)
                                                        .copyWith(
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  AppPaddings
                                                      .small
                                                      .horizontalSpace,
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
