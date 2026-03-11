import 'package:fast_food/core/config/di.dart';
import 'package:fast_food/core/config/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final _appRouter = AppRouter();
final di = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wuhxpwaeozxbbhntwrhu.supabase.co',
    anonKey: 'sb_secret_1IoGhx9IoBZtAlAFKLc6mw_YifP5lff',
  );
  configureDependencies(di);

  runApp(FastFoodApp());
}

class FastFoodApp extends StatelessWidget {
  const FastFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
