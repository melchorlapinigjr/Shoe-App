import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/api/api_service_impl.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service_impl.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference_impl.dart';
import 'package:flutter_shoe_app/views/home/homepage_view.dart';
import 'package:flutter_shoe_app/views/login/log_in_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: LoginView, name: "LoginView", initial: true),
    AdaptiveRoute(page: HomepageView, name: "HomepageView"),
  ],
  dependencies: [
    LazySingleton(classType: SharedPreferenceImpl, asType: SharedPreference),
    LazySingleton(classType: ApiServiceImpl, asType: ApiService),
    LazySingleton(classType: NavigationServiceImpl, asType: NavigationService),
  ],
)
class App {}
