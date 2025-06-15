import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import '../restaurant_discovery_screen/models/restaurant_model.dart';

// lib/presentation/restaurant_details_screen/restaurant_details_screen.dart

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RestaurantModel restaurant = Get.arguments;

    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRestaurantImage(restaurant),
          _buildRestaurantInfo(restaurant),
          _buildRestaurantDescription(restaurant),
          Spacer(),
          _buildButtonRow(restaurant),
        ],
      ),
    );
  }

  Widget _buildRestaurantImage(RestaurantModel restaurant) {
    return Stack(
      children: [
        CustomImageView(
          imagePath: restaurant.imagePath?.value ?? '',
          height: 240.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40.h,
          left: 16.h,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: appTheme.whiteCustom.withAlpha(179),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                color: appTheme.blackCustom,
                size: 24.h,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantInfo(RestaurantModel restaurant) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name?.value ?? '',
            style: TextStyleHelper.instance.title19BoldPoppins
                .copyWith(height: 1.5),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                '★★★★☆ ${restaurant.rating?.value ?? ''}',
                style: TextStyleHelper.instance.body14Poppins
                    .copyWith(color: appTheme.colorFFFF98, height: 1.57),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            restaurant.location?.value ?? '',
            style: TextStyleHelper.instance.body14Poppins.copyWith(
              color: appTheme.colorFF6666,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantDescription(RestaurantModel restaurant) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descrição',
            style: TextStyleHelper.instance.title16BoldPoppins
                .copyWith(height: 1.5),
          ),
          SizedBox(height: 8.h),
          Text(
            restaurant.description?.value ?? '',
            style: TextStyleHelper.instance.body14Poppins.copyWith(
              color: appTheme.colorFF6666,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(RestaurantModel restaurant) {
    return Container(
      padding: EdgeInsets.all(16.h),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              icon: Icons.star,
              label: 'Avaliar',
              onTap: () => Get.toNamed(AppRoutes.restaurantReviewScreen,
                  arguments: restaurant),
            ),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: _buildActionButton(
              icon: Icons.phone,
              label: 'Pedir Entrega',
              onTap: () => _makePhoneCall(restaurant.telefone?.value ?? ''),
            ),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: _buildActionButton(
              icon: Icons.map,
              label: 'Ver no Mapa',
              onTap: () => Get.toNamed(AppRoutes.restaurantMapExplorerScreen,
                  arguments: restaurant),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: appTheme.colorFFFF98,
        foregroundColor: appTheme.whiteCustom,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24.h),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyleHelper.instance.body12Poppins.copyWith(
              color: appTheme.whiteCustom,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Get.snackbar(
        'Erro',
        'Não foi possível realizar a chamada para $phoneNumber',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
