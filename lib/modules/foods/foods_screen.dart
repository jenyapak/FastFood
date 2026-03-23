import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/base/base_state.dart';

import 'package:fast_food/main.dart';
import 'package:fast_food/modules/main/domain/entity/food_entity.dart';
import 'package:fast_food/modules/main/presentation/cubit/get_food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key, required this.restaurantId});
  final String restaurantId;

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  late final _getFoodsCubit = di<GetFoodCubit>()..getFoods(widget.restaurantId);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),

      body: BlocBuilder<GetFoodCubit, BaseState<List<FoodEntity>>>(
        bloc: _getFoodsCubit,
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == StateStatus.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message ?? 'An error occurred'),
                ElevatedButton(
                  onPressed: () {
                    _getFoodsCubit.getFoods(widget.restaurantId);
                  },
                  child: Text('Retry'),
                ),
              ],
            );
          } else if (state.status == StateStatus.success) {
            if (state.model == null || state.model!.isEmpty) {
              return const Center(child: Text('List is empty'));
            }

            return ListView.builder(
              itemCount: state.model?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      state.model?[index].image ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  subtitle: Text(state.model?[index].description ?? ''),
                  title: Text(state.model?[index].name ?? ''),

                  trailing: Text(
                    '${state.model?[index].price.toStringAsFixed(2) ?? ''} сом',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            );
          } else if (state.status == StateStatus.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message ?? 'An error occurred'),
                ElevatedButton(
                  onPressed: () {
                    _getFoodsCubit.getFoods(widget.restaurantId);
                  },
                  child: Text('Retry'),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
