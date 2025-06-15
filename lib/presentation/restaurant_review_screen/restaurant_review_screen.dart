import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../restaurant_discovery_screen/models/restaurant_model.dart';

// lib/presentation/restaurant_review_screen/restaurant_review_screen.dart

class RestaurantReviewScreen extends StatefulWidget {
  const RestaurantReviewScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantReviewScreen> createState() => _RestaurantReviewScreenState();
}

class _RestaurantReviewScreenState extends State<RestaurantReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RestaurantModel restaurant = Get.arguments;

    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      appBar: AppBar(
        backgroundColor: appTheme.colorFFFF98,
        title: Text(
          'Avaliar ${restaurant.name?.value ?? "Restaurante"}',
          style: TextStyleHelper.instance.title16BoldPoppins.copyWith(
            color: appTheme.whiteCustom,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appTheme.whiteCustom),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Conte-nos sua experiência',
              style: TextStyleHelper.instance.title16BoldPoppins,
            ),
            SizedBox(height: 16.h),
            _buildReviewTextField(),
            if (_errorMessage != null)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  _errorMessage!,
                  style: TextStyleHelper.instance.body12Poppins.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            Spacer(),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewTextField() {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.colorFFFAFA,
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(color: appTheme.colorFFCAC4),
      ),
      child: TextField(
        controller: _reviewController,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: 'Escreva sua avaliação aqui...',
          hintStyle: TextStyleHelper.instance.body14Poppins.copyWith(
            color: appTheme.colorFF4945.withAlpha(128),
          ),
          contentPadding: EdgeInsets.all(16.h),
          border: InputBorder.none,
        ),
        style: TextStyleHelper.instance.body14Poppins.copyWith(
          color: appTheme.colorFF4945,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _isSubmitting ? null : _submitReview,
      style: ElevatedButton.styleFrom(
        backgroundColor: appTheme.colorFFFF98,
        foregroundColor: appTheme.whiteCustom,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        disabledBackgroundColor: appTheme.colorFFFF98.withAlpha(128),
      ),
      child: _isSubmitting
          ? SizedBox(
              height: 24.h,
              width: 24.h,
              child: CircularProgressIndicator(
                color: appTheme.whiteCustom,
                strokeWidth: 2.0,
              ),
            )
          : Text(
              'Enviar',
              style: TextStyleHelper.instance.title16BoldPoppins.copyWith(
                color: appTheme.whiteCustom,
              ),
            ),
    );
  }

  void _submitReview() {
    setState(() {
      _errorMessage = null;
    });

    // Validar o campo
    if (_reviewController.text.trim().isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, escreva sua avaliação antes de enviar.';
      });
      return;
    }

    // Simular o envio
    setState(() {
      _isSubmitting = true;
    });

    // Simular um delay de rede
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.reviewConfirmationScreen);
    });
  }
}
