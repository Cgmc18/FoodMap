import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxBorder? border;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.height,
    this.width,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled || isLoading;
    final Color bgColor = backgroundColor ?? appTheme.colorFFFF98;
    final Color txtColor = textColor ?? appTheme.whiteCustom;

    return Container(
        height: height ?? 52.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: disabled ? bgColor.withAlpha(128) : bgColor,
            borderRadius: borderRadius ?? BorderRadius.circular(12.h),
            border: border,
            boxShadow: [
              if (!disabled)
                BoxShadow(
                    color: bgColor.withAlpha(77),
                    blurRadius: 8,
                    offset: Offset(0, 4)),
            ]),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: disabled ? null : onPressed,
                borderRadius: borderRadius ?? BorderRadius.circular(12.h),
                child: Container(
                    padding: padding ??
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (prefixIcon != null) ...[
                            prefixIcon!,
                            SizedBox(width: 8.h),
                          ],
                          if (isLoading)
                            SizedBox(
                                width: 20.h,
                                height: 20.h,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2.0, color: txtColor))
                          else
                            Text(text,
                                style: TextStyleHelper
                                    .instance.title16BoldPoppins
                                    .copyWith(
                                        color: txtColor,
                                        fontSize: fontSize ?? 16.fSize,
                                        fontWeight: FontWeight.bold)),
                          if (suffixIcon != null && !isLoading) ...[
                            SizedBox(width: 8.h),
                            suffixIcon!,
                          ],
                        ])))));
  }
}
