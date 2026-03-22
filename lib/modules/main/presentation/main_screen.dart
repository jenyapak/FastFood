import 'package:auto_route/auto_route.dart';
import 'package:fast_food/main.dart';
import 'package:fast_food/modules/main/presentation/cubit/get_food_cubit.dart';
import 'package:fast_food/modules/main/presentation/widgets/restoraunts_list_widget.dart';
import 'package:flutter/material.dart';

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
    return RestorauntsListWidget();
  }
}
