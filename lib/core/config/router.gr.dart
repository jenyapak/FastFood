// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:fast_food/modules/autherization/presentation/auth_screen.dart'
    as _i1;
import 'package:fast_food/modules/foods/foods_screen.dart' as _i2;
import 'package:fast_food/modules/main/presentation/main_screen.dart' as _i3;
import 'package:fast_food/modules/splash/splash_screen.dart' as _i4;
import 'package:fast_food/modules/welcome/welcome_screen.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.FoodsScreen]
class FoodsRoute extends _i6.PageRouteInfo<FoodsRouteArgs> {
  FoodsRoute({
    _i7.Key? key,
    required String restaurantId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         FoodsRoute.name,
         args: FoodsRouteArgs(key: key, restaurantId: restaurantId),
         initialChildren: children,
       );

  static const String name = 'FoodsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FoodsRouteArgs>();
      return _i2.FoodsScreen(key: args.key, restaurantId: args.restaurantId);
    },
  );
}

class FoodsRouteArgs {
  const FoodsRouteArgs({this.key, required this.restaurantId});

  final _i7.Key? key;

  final String restaurantId;

  @override
  String toString() {
    return 'FoodsRouteArgs{key: $key, restaurantId: $restaurantId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FoodsRouteArgs) return false;
    return key == other.key && restaurantId == other.restaurantId;
  }

  @override
  int get hashCode => key.hashCode ^ restaurantId.hashCode;
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute({List<_i6.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.WelcomeScreen();
    },
  );
}
