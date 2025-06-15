import 'package:get/get.dart';
import '../../../core/app_export.dart';

class RestaurantModel {
  Rx<String>? name;
  Rx<String>? rating;
  Rx<String>? location;
  Rx<String>? imagePath;
  Rx<bool>? isFeatured;
  Rx<String>? description;
  Rx<String>? telefone;
  Rx<double>? latitude;
  Rx<double>? longitude;

  RestaurantModel({
    this.name,
    this.rating,
    this.location,
    this.imagePath,
    this.isFeatured,
    this.description,
    this.telefone,
    this.latitude,
    this.longitude,
  });
}
