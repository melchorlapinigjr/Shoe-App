// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';

import '../views/home/homepage_view.dart';
import '../views/login/log_in_view.dart';

class Routes {
  static const String LoginView = '/';
  static const String HomepageView = '/homepage-view';
  static const all = <String>{
    LoginView,
    HomepageView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.LoginView, page: LoginView),
    RouteDef(Routes.HomepageView, page: HomepageView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    HomepageView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomepageView(),
        settings: data,
      );
    },
  };
}
