import 'package:get/get.dart';
import '../../../core/app_export.dart';

class RestaurantDiscoveryModel {
  Rx<String>? searchQuery;
  Rx<int>? selectedCategoryIndex;

  RestaurantDiscoveryModel({
    this.searchQuery,
    this.selectedCategoryIndex,
  });
}
