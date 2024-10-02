// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:cashflowy/features/account/presentation/pages/account_page.dart'
    as _i1;
import 'package:cashflowy/features/category/presentation/pages/category_page.dart'
    as _i4;
import 'package:cashflowy/features/home/presentation/pages/home_page.dart'
    as _i5;
import 'package:cashflowy/features/life_span/presentation/pages/life_span_page.dart'
    as _i6;
import 'package:cashflowy/features/notification/business/business.dart' as _i11;
import 'package:cashflowy/features/notification/presentation/libraries/app_notification_list_library.dart'
    as _i3;
import 'package:cashflowy/features/notification/presentation/pages/app_notification_item_page.dart'
    as _i2;
import 'package:cashflowy/features/report/presentation/pages/report_page.dart'
    as _i7;
import 'package:cashflowy/features/splash/presentation/pages/splash_page.dart'
    as _i8;
import 'package:cashflowy/features/transaction/presentation/pages/transaction_page.dart'
    as _i9;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i10.PageRouteInfo<void> {
  const AccountRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountPage();
    },
  );
}

/// generated route for
/// [_i2.AppNotificationItemPage]
class AppNotificationItemRoute
    extends _i10.PageRouteInfo<AppNotificationItemRouteArgs> {
  AppNotificationItemRoute({
    required _i11.AppNotificationEntity app,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AppNotificationItemRoute.name,
          args: AppNotificationItemRouteArgs(
            app: app,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AppNotificationItemRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppNotificationItemRouteArgs>();
      return _i2.AppNotificationItemPage(
        app: args.app,
        key: args.key,
      );
    },
  );
}

class AppNotificationItemRouteArgs {
  const AppNotificationItemRouteArgs({
    required this.app,
    this.key,
  });

  final _i11.AppNotificationEntity app;

  final _i12.Key? key;

  @override
  String toString() {
    return 'AppNotificationItemRouteArgs{app: $app, key: $key}';
  }
}

/// generated route for
/// [_i3.AppNotificationListPage]
class AppNotificationListRoute extends _i10.PageRouteInfo<void> {
  const AppNotificationListRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AppNotificationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppNotificationListRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.AppNotificationListPage();
    },
  );
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i10.PageRouteInfo<void> {
  const CategoryRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.CategoryPage();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.LifeSpanPage]
class LifeSpanRoute extends _i10.PageRouteInfo<void> {
  const LifeSpanRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LifeSpanRoute.name,
          initialChildren: children,
        );

  static const String name = 'LifeSpanRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.LifeSpanPage();
    },
  );
}

/// generated route for
/// [_i7.ReportPage]
class ReportRoute extends _i10.PageRouteInfo<void> {
  const ReportRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.ReportPage();
    },
  );
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashPage();
    },
  );
}

/// generated route for
/// [_i9.TransactionPage]
class TransactionRoute extends _i10.PageRouteInfo<void> {
  const TransactionRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.TransactionPage();
    },
  );
}
