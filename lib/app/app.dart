import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/api/api_service_impl.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service_impl.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference_impl.dart';
import 'package:flutter_shoe_app/views/add_shoe/add_shoe_view.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_page_view.dart';
import 'package:flutter_shoe_app/views/home/homepage_view.dart';
import 'package:flutter_shoe_app/views/login/log_in_register.dart';
import 'package:flutter_shoe_app/views/login/log_in_view.dart';
import 'package:flutter_shoe_app/views/my_purchases/my_purchases_view.dart';
import 'package:flutter_shoe_app/views/search_page/search_page_view.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: LoginView, name: "LoginView", initial: true),
    AdaptiveRoute(page: HomepageView, name: "HomepageView"),
    AdaptiveRoute(page: ShoeDetailsView, name: "ShoeDetails"),
    AdaptiveRoute(page: SearchPageView, name: "SearchPageView"),
    AdaptiveRoute(page: AddShoeView, name: "AddShoeView"),
    AdaptiveRoute(page: LoginRegister, name: "Register"),
    AdaptiveRoute(page: CheckoutPageView, name: "Checkout"),
    AdaptiveRoute(page: MyPurchasesView, name: "MyPurchases"),
  ],
  dependencies: [
    LazySingleton(classType: SharedPreferenceImpl, asType: SharedPreference),
    LazySingleton(classType: ApiServiceImpl, asType: ApiService),
    LazySingleton(classType: NavigationServiceImpl, asType: NavigationService),
    LazySingleton(classType: ApplicationViewModel, asType: ApplicationViewModel)
  ],
)
class App {}
