import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './controller/restaurant_discovery_controller.dart';
import './widgets/category_chip_widget.dart';
import './widgets/restaurant_card_widget.dart';

class RestaurantDiscoveryScreen
    extends GetWidget<RestaurantDiscoveryController> {
  const RestaurantDiscoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      body: SizedBox(
        height: 917.h,
        width: 412.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchSection(),
              _buildCategoryFilters(),
              _buildRestaurantSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 118.h,
      width: 412.h,
      child: Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse1,
            height: 118.h,
            width: 412.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 46.h,
            left: 147.h,
            child: Text(
              'FoodMap',
              style: TextStyleHelper.instance.headline25BoldPoppins
                  .copyWith(height: 1.52),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(26.h, 20.h, 26.h, 0),
      child: Container(
        height: 56.h,
        width: 360.h,
        decoration: BoxDecoration(
          color: appTheme.colorFFFAFA,
          border: Border.all(color: appTheme.colorFFE4E4),
          borderRadius: BorderRadius.circular(28.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.blackCustom.withAlpha(26),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 24.h),
                child: TextField(
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    hintText: 'Pesquise aqui',
                    hintStyle: TextStyleHelper.instance.body14Poppins
                        .copyWith(color: appTheme.colorFF4945, height: 1.5),
                    border: InputBorder.none,
                  ),
                  style: TextStyleHelper.instance.body14Poppins
                      .copyWith(color: appTheme.colorFF4945, height: 1.5),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 24.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgIcon,
                height: 24.h,
                width: 24.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return Container(
      margin: EdgeInsets.fromLTRB(12.h, 28.h, 12.h, 0),
      height: 32.h,
      child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 8.h),
            itemBuilder: (context, index) {
              return CategoryChipWidget(
                category: controller.categories[index],
                onTap: () => controller.selectCategory(index),
              );
            },
          )),
    );
  }

  Widget _buildRestaurantSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 28.h, 16.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Restaurante do Dia',
            style: TextStyleHelper.instance.title19BoldPoppins
                .copyWith(height: 1.53),
          ),
          SizedBox(height: 16.h),
          Obx(() => ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.restaurants.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  return RestaurantCardWidget(
                    restaurant: controller.restaurants[index],
                    isFeatured: index == 0,
                  );
                },
              )),
          SizedBox(height: 65.h),
        ],
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
            onTap: () => controller.onBottomNavTap(0),
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
            onTap: () => controller.onBottomNavTap(1),
            child: Container(
              width: 35.h,
              height: 35.h,
              child: CustomImageView(
                imagePath: ImageConstant.imgMynauimapsolid,
                height: 35.h,
                width: 35.h,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => controller.onBottomNavTap(2),
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
