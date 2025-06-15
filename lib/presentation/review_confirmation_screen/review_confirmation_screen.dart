import 'package:flutter/material.dart';

import '../../core/app_export.dart';

// lib/presentation/review_confirmation_screen/review_confirmation_screen.dart

class ReviewConfirmationScreen extends StatelessWidget {
  const ReviewConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSuccessIcon(),
            SizedBox(height: 24.h),
            _buildConfirmationMessage(),
            SizedBox(height: 32.h),
            _buildOkButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 80.h,
      height: 80.h,
      decoration: BoxDecoration(
        color: appTheme.colorFFFF98.withAlpha(51),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check_circle,
        color: appTheme.colorFFFF98,
        size: 60.h,
      ),
    );
  }

  Widget _buildConfirmationMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: Column(
        children: [
          Text(
            'Avaliação Enviada com Sucesso!',
            textAlign: TextAlign.center,
            style: TextStyleHelper.instance.title19BoldPoppins,
          ),
          SizedBox(height: 16.h),
          Text(
            'Agradecemos por compartilhar sua opinião. Sua avaliação é muito importante para nós e para outros usuários do FoodMap.',
            textAlign: TextAlign.center,
            style: TextStyleHelper.instance.body14Poppins.copyWith(
              color: appTheme.colorFF6666,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOkButton() {
    return ElevatedButton(
      onPressed: () {
        // Retorna para a tela de detalhes do restaurante
        Get.back(closeOverlays: true);
        Get.back(); // Volta para a tela de detalhes
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appTheme.colorFFFF98,
        foregroundColor: appTheme.whiteCustom,
        padding: EdgeInsets.symmetric(horizontal: 64.h, vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      ),
      child: Text(
        'OK',
        style: TextStyleHelper.instance.title16BoldPoppins.copyWith(
          color: appTheme.whiteCustom,
        ),
      ),
    );
  }
}
