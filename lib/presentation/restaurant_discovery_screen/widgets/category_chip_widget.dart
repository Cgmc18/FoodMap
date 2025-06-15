import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/category_model.dart';

class CategoryChipWidget extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  const CategoryChipWidget({
    Key? key,
    required this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = category.isSelected?.value ?? false;
    bool hasIcon = category.hasIcon?.value ?? false;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: hasIcon ? 8.h : 16.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEE8E00) : Color(0xFFD7D7D74C),
          border: isSelected ? null : Border.all(color: appTheme.colorFFCAC4),
          borderRadius: BorderRadius.circular(11.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.blackCustom.withAlpha(26),
              offset: Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasIcon && isSelected)
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSelectedIcon,
                  height: 18.h,
                  width: 18.h,
                ),
              ),
            Text(
              category.title?.value ?? '',
              style: TextStyleHelper.instance.body14Poppins.copyWith(
                  color:
                      isSelected ? appTheme.whiteCustom : appTheme.colorFF4945,
                  height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
