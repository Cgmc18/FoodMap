import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import '../restaurant_discovery_screen/models/restaurant_model.dart';

class RestaurantMapExplorerScreen extends StatefulWidget {
  const RestaurantMapExplorerScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantMapExplorerScreen> createState() =>
      _RestaurantMapExplorerScreenState();
}

class _RestaurantMapExplorerScreenState
    extends State<RestaurantMapExplorerScreen> {
  RestaurantModel? restaurant;

  @override
  void initState() {
    super.initState();
    restaurant = Get.arguments;
  }

  void _onBottomNavTap(int index) {
    switch (index) {
      case 0:
        // Home navigation
        Get.offAllNamed(AppRoutes.restaurantDiscoveryScreen);
        break;
      case 1:
        // Map - current screen, no action needed
        break;
      case 2:
        // Logout with confirmation
        _showLogoutConfirmation();
        break;
    }
  }

  void _showLogoutConfirmation() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Confirmar Logout',
          style: TextStyleHelper.instance.title16BoldPoppins,
        ),
        content: Text(
          'Deseja realmente sair do aplicativo?',
          style: TextStyleHelper.instance.body14Poppins.copyWith(
            color: appTheme.colorFF6666,
          ),
        ),
        backgroundColor: appTheme.whiteCustom,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancelar',
              style: TextStyleHelper.instance.body14Poppins.copyWith(
                color: appTheme.colorFF6666,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Close dialog
              Get.offAllNamed(AppRoutes.loginScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.colorFFFF98,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.h),
              ),
            ),
            child: Text(
              'Sair',
              style: TextStyleHelper.instance.body14Poppins.copyWith(
                color: appTheme.whiteCustom,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  String _getMapImageForRestaurant() {
    final restaurantName = restaurant?.name?.value?.toLowerCase() ?? '';

    if (restaurantName.contains('argento')) {
      return ImageConstant.imgMapArgento;
    } else if (restaurantName.contains('show')) {
      return ImageConstant.imgMapShow;
    } else if (restaurantName.contains('vila')) {
      return ImageConstant.imgMapVila;
    }

    // Default fallback image
    return ImageConstant.imgMapArgento;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildStaticMap(),
          _buildBackButton(),
          _buildRestaurantCard(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildStaticMap() {
    return CustomImageView(
      imagePath: _getMapImageForRestaurant(),
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 40.h,
      left: 16.h,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: appTheme.whiteCustom.withAlpha(230),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: appTheme.blackCustom.withAlpha(26),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back,
            color: appTheme.blackCustom,
            size: 24.h,
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantCard() {
    return Positioned(
      bottom: 65.h, // Adjust for bottom navigation bar
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: appTheme.whiteCustom,
          borderRadius: BorderRadius.circular(16.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.blackCustom.withAlpha(26),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: restaurant?.imagePath?.value ?? '',
                  height: 80.h,
                  width: 80.h,
                  radius: BorderRadius.circular(8.h),
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant?.name?.value ?? '',
                        style: TextStyleHelper.instance.title16BoldPoppins,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '★★★★☆ ${restaurant?.rating?.value ?? ''}',
                        style: TextStyleHelper.instance.body14Poppins.copyWith(
                            color: appTheme.colorFFFF98, height: 1.57),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        restaurant?.location?.value ?? '',
                        style: TextStyleHelper.instance.body12Poppins,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.toNamed(
                  AppRoutes.restaurantDetailsScreen,
                  arguments: restaurant,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appTheme.colorFFFF98,
                foregroundColor: appTheme.whiteCustom,
                minimumSize: Size(double.infinity, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              child: Text(
                'Ver Detalhes do Restaurante',
                style: TextStyleHelper.instance.body14Poppins.copyWith(
                  color: appTheme.whiteCustom,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        color: appTheme.colorFFF7F7,
        border: Border(
          top: BorderSide(color: Color(0xFFA1A1A1CC)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => _onBottomNavTap(0),
            child: Container(
              width: 35.h,
              height: 35.h,
              child: CustomImageView(
                imagePath: ImageConstant.imgMaterialsymbolshomerounded,
                height: 35.h,
                width: 35.h,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onBottomNavTap(1),
            child: Container(
              width: 35.h,
              height: 35.h,
              child: CustomImageView(
                imagePath: ImageConstant.imgMynauimapsolid,
                height: 35.h,
                width: 35.h,
                color: appTheme.colorFFFF98, // Highlight current tab
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onBottomNavTap(2),
            child: Container(
              width: 35.h,
              height: 35.h,
              child: CustomImageView(
                imagePath: ImageConstant.imgMajesticonslogout,
                height: 35.h,
                width: 35.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
