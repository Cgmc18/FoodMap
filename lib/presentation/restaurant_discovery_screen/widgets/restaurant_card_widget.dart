import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/restaurant_discovery_controller.dart';
import '../models/restaurant_model.dart';

class RestaurantCardWidget extends StatelessWidget {
  final RestaurantModel restaurant;
  final bool isFeatured;

  const RestaurantCardWidget({
    Key? key,
    required this.restaurant,
    this.isFeatured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantDiscoveryController>();

    return GestureDetector(
      onTap: () => controller.onRestaurantTap(restaurant),
      child: isFeatured ? _buildFeaturedCard() : _buildRegularCard(),
    );
  }

  Widget _buildFeaturedCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: restaurant.imagePath?.value ?? '',
          height: 153.h,
          width: 379.h,
          fit: BoxFit.cover,
          radius: BorderRadius.circular(8.h),
        ),
        SizedBox(height: 12.h),
        Text(
          restaurant.name?.value ?? '',
          style:
              TextStyleHelper.instance.title16BoldPoppins.copyWith(height: 1.5),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Text(
              '★★★★☆ ${restaurant.rating?.value ?? ''}',
              style: TextStyleHelper.instance.body14Poppins
                  .copyWith(color: appTheme.colorFFFF98, height: 1.57),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          restaurant.location?.value ?? '',
          style: TextStyleHelper.instance.body12Poppins.copyWith(height: 1.58),
        ),
      ],
    );
  }

  Widget _buildRegularCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: restaurant.imagePath?.value ?? '',
          height: 100.h,
          width: 100.h,
          fit: BoxFit.cover,
          radius: BorderRadius.circular(8.h),
        ),
        SizedBox(width: 16.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name?.value ?? '',
                style: TextStyleHelper.instance.title16BoldPoppins
                    .copyWith(height: 1.5),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    '★★★★☆ ${restaurant.rating?.value ?? ''}',
                    style: TextStyleHelper.instance.body14Poppins
                        .copyWith(color: appTheme.colorFFFF98, height: 1.57),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                restaurant.location?.value ?? '',
                style: TextStyleHelper.instance.body12Poppins
                    .copyWith(height: 1.67),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
