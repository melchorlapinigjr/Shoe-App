// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../core/services/api/api_service.dart';
import '../core/services/api/api_service_impl.dart';
import '../core/services/navigation/navigation_service.dart';
import '../core/services/navigation/navigation_service_impl.dart';
import '../core/services/shared_preferrence/shared_preference.dart';
import '../core/services/shared_preferrence/shared_preference_impl.dart';
import '../views/application/application_view_model.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton<SharedPreference>(() => SharedPreferenceImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  locator
      .registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
  locator.registerLazySingleton<ApplicationViewModel>(
      () => ApplicationViewModel());
}
