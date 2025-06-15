import '../core/app_export.dart';
import 'package:get/get.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/registration_screen/registration_screen.dart';
import '../presentation/restaurant_discovery_screen/restaurant_discovery_screen.dart';
import '../presentation/restaurant_details_screen/restaurant_details_screen.dart';
import '../presentation/restaurant_review_screen/restaurant_review_screen.dart';
import '../presentation/review_confirmation_screen/review_confirmation_screen.dart';
import '../presentation/restaurant_map_explorer_screen/restaurant_map_explorer_screen.dart';

import '../presentation/restaurant_discovery_screen/binding/restaurant_discovery_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String splashScreen = '/splash-screen';
  static const String loginScreen = '/login-screen';
  static const String registrationScreen = '/registration-screen';
  static const String restaurantDiscoveryScreen =
      '/restaurant_discovery_screen';
  static const String restaurantDetailsScreen = '/restaurant-details-screen';
  static const String restaurantReviewScreen = '/restaurant-review-screen';
  static const String reviewConfirmationScreen = '/review-confirmation-screen';
  static const String restaurantMapExplorerScreen =
      '/restaurant-map-explorer-screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: registrationScreen,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: restaurantDiscoveryScreen,
      page: () => RestaurantDiscoveryScreen(),
      bindings: [RestaurantDiscoveryBinding()],
    ),
    GetPage(
      name: restaurantDetailsScreen,
      page: () => RestaurantDetailsScreen(),
    ),
    GetPage(
      name: restaurantReviewScreen,
      page: () => RestaurantReviewScreen(),
    ),
    GetPage(
      name: reviewConfirmationScreen,
      page: () => ReviewConfirmationScreen(),
    ),
    GetPage(
      name: restaurantMapExplorerScreen,
      page: () => RestaurantMapExplorerScreen(),
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
    ),
  ];
}
