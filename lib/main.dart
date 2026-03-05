import 'package:fast_food/core/config/router.dart';
import 'package:flutter/material.dart';

final _appRouter = AppRouter();

void main() {
  runApp(FastFoodApp());
}

class FastFoodApp extends StatelessWidget {
  const FastFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _appRouter.config());
  }
}
