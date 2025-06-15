import 'package:get/get.dart';
import '../../../core/app_export.dart';

class CategoryModel {
  Rx<String>? title;
  Rx<bool>? isSelected;
  Rx<bool>? hasIcon;

  CategoryModel({
    this.title,
    this.isSelected,
    this.hasIcon,
  });
}
