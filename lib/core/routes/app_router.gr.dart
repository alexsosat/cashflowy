// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:cashflowy/features/account/presentation/libraries/create_account_library.dart'
    as _i1;
import 'package:cashflowy/features/splash/presentation/pages/splash_page.dart'
    as _i2;

/// generated route for
/// [_i1.CreateAccountPage]
class CreateAccountRoute extends _i3.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i3.PageRouteInfo>? children})
    : super(CreateAccountRoute.name, initialChildren: children);

  static const String name = 'CreateAccountRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreateAccountPage();
    },
  );
}

/// generated route for
/// [_i2.SplashPage]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashPage();
    },
  );
}
