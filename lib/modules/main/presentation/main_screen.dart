import 'package:auto_route/auto_route.dart';
import 'package:fast_food/modules/main/presentation/widgets/restoraunts_list_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RestorauntsListWidget();
  }
}
