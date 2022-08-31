// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/cart_object.dart';
import '../models/shoe_object.dart';
import '../views/add_shoe/add_shoe_view.dart';
import '../views/application/application_view_model.dart';
import '../views/check_out_page/checkout_page_view.dart';
import '../views/home/homepage_view.dart';
import '../views/login/log_in_register.dart';
import '../views/login/log_in_view.dart';
import '../views/search_page/search_page_view.dart';
import '../views/shoe_details/shoe_details_view.dart';
import '../views/widgets/network_connectivity.dart';

class Routes {
  static const String LoginView = '/';
  static const String HomepageView = '/homepage-view';
  static const String ShoeDetails = '/shoe-details-view';
  static const String SearchPageView = '/search-page-view';
  static const String AddShoeView = '/add-shoe-view';
  static const String Register = '/login-register';
  static const String Checkout = '/checkout-page-view';
  static const String Network = '/network-connectivity';
  static const all = <String>{
    LoginView,
    HomepageView,
    ShoeDetails,
    SearchPageView,
    AddShoeView,
    Register,
    Checkout,
    Network,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.LoginView, page: LoginView),
    RouteDef(Routes.HomepageView, page: HomepageView),
    RouteDef(Routes.ShoeDetails, page: ShoeDetailsView),
    RouteDef(Routes.SearchPageView, page: SearchPageView),
    RouteDef(Routes.AddShoeView, page: AddShoeView),
    RouteDef(Routes.Register, page: LoginRegister),
    RouteDef(Routes.Checkout, page: CheckoutPageView),
    RouteDef(Routes.Network, page: NetworkConnectivity),
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
    ShoeDetailsView: (data) {
      var args = data.getArgs<ShoeDetailsViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ShoeDetailsView(
          args.shoe,
          key: args.key,
          applicationViewModel: args.applicationViewModel,
          cartObject: args.cartObject,
        ),
        settings: data,
      );
    },
    SearchPageView: (data) {
      var args = data.getArgs<SearchPageViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchPageView(
          key: args.key,
          items: args.items,
        ),
        settings: data,
      );
    },
    AddShoeView: (data) {
      var args = data.getArgs<AddShoeViewArguments>(
        orElse: () => AddShoeViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AddShoeView(key: args.key),
        settings: data,
      );
    },
    LoginRegister: (data) {
      var args = data.getArgs<LoginRegisterArguments>(
        orElse: () => LoginRegisterArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoginRegister(key: args.key),
        settings: data,
      );
    },
    CheckoutPageView: (data) {
      var args = data.getArgs<CheckoutPageViewArguments>(
        orElse: () => CheckoutPageViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CheckoutPageView(key: args.key),
        settings: data,
      );
    },
    NetworkConnectivity: (data) {
      var args = data.getArgs<NetworkConnectivityArguments>(
        orElse: () => NetworkConnectivityArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => NetworkConnectivity(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ShoeDetailsView arguments holder class
class ShoeDetailsViewArguments {
  final Shoe shoe;
  final Key? key;
  final ApplicationViewModel applicationViewModel;
  final CartObject? cartObject;
  ShoeDetailsViewArguments(
      {required this.shoe,
      this.key,
      required this.applicationViewModel,
      this.cartObject});
}

/// SearchPageView arguments holder class
class SearchPageViewArguments {
  final Key? key;
  final List<Shoe> items;
  SearchPageViewArguments({this.key, required this.items});
}

/// AddShoeView arguments holder class
class AddShoeViewArguments {
  final Key? key;
  AddShoeViewArguments({this.key});
}

/// LoginRegister arguments holder class
class LoginRegisterArguments {
  final Key? key;
  LoginRegisterArguments({this.key});
}

/// CheckoutPageView arguments holder class
class CheckoutPageViewArguments {
  final Key? key;
  CheckoutPageViewArguments({this.key});
}

/// NetworkConnectivity arguments holder class
class NetworkConnectivityArguments {
  final Key? key;
  NetworkConnectivityArguments({this.key});
}
