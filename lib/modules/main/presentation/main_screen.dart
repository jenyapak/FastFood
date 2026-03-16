import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/base/base_state.dart';
import 'package:fast_food/main.dart';
import 'package:fast_food/modules/main/domain/entity/food_entity.dart';
import 'package:fast_food/modules/main/presentation/cubit/get_food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _getFoodsCubit = di<GetFoodCubit>()..getFoods();

  @override
  void dispose() {
    _getFoodsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _getFoodsCubit,
        child: BlocBuilder<GetFoodCubit, BaseState<List<FoodEntity>>>(
          builder: (context, state) {
            if (state.status == StateStatus.error) {
              return Center(child: Text(state.message ?? 'Error'));
            }
            if (state.status == StateStatus.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.status == StateStatus.success) {
              if (state.model?.isEmpty ?? false) {
                return Center(child: Text('List is empty'));
              }
              return ListView.builder(
                itemCount: state.model?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.model?[index].name ?? ''),
                    trailing: Text(state.model?[index].rating.toString() ?? ''),
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
