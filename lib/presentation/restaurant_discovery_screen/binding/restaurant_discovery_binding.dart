import 'package:get/get.dart';
import '../controller/restaurant_discovery_controller.dart';
import '../../../core/app_export.dart';

class RestaurantDiscoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantDiscoveryController>(
      () => RestaurantDiscoveryController(),
    );
  }
}
