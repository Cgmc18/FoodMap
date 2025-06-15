import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import '../login_screen/widgets/custom_button.dart';
import '../login_screen/widgets/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Simulate registration process
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });
        Get.offAllNamed(AppRoutes.restaurantDiscoveryScreen);
      });
    }
  }

  void _navigateToLogin() {
    Get.back();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme sua senha';
    }
    if (value != _passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC7023),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              _buildBackButton(),
              SizedBox(height: 20.h),
              _buildLogo(),
              SizedBox(height: 32.h),
              _buildRegistrationContainer(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: _navigateToLogin,
        child: Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.h),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: CustomImageView(
        imagePath: 'assets/images/logo_foodmap.png',
        height: 120.h,
        width: 120.h,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildRegistrationContainer() {
    return Container(
      padding: EdgeInsets.all(32.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Cadastre-se',
                    style: TextStyleHelper.instance.title19BoldPoppins.copyWith(
                      fontSize: 24.fSize,
                      color: Color(0xFFEC7023),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Preencha os dados para se cadastrar',
                    style: TextStyleHelper.instance.body14Poppins.copyWith(
                      color: appTheme.colorFF6666,
                      fontSize: 14.fSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            _buildRegistrationForm(),
            SizedBox(height: 32.h),
            _buildRegisterButton(),
            SizedBox(height: 24.h),
            _buildLoginLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Usuário',
          style: TextStyleHelper.instance.title16BoldPoppins.copyWith(
            fontSize: 14.fSize,
            color: appTheme.blackCustom,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          controller: _usernameController,
          hintText: 'Digite seu nome de usuário',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, digite um usuário';
            }
            if (value.length < 3) {
              return 'Usuário deve ter pelo menos 3 caracteres';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        Text(
          'Nova Senha',
          style: TextStyleHelper.instance.title16BoldPoppins.copyWith(
            fontSize: 14.fSize,
            color: appTheme.blackCustom,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          controller: _passwordController,
          hintText: 'Digite sua nova senha',
          isPassword: true,
          isPasswordVisible: _isPasswordVisible,
          onPasswordToggle: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, digite uma senha';
            }
            if (value.length < 6) {
              return 'Senha deve ter pelo menos 6 caracteres';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        Text(
          'Confirmar Senha',
          style: TextStyleHelper.instance.title16BoldPoppins.copyWith(
            fontSize: 14.fSize,
            color: appTheme.blackCustom,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          controller: _confirmPasswordController,
          hintText: 'Confirme sua senha',
          isPassword: true,
          isPasswordVisible: _isConfirmPasswordVisible,
          onPasswordToggle: () {
            setState(() {
              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
            });
          },
          validator: _validateConfirmPassword,
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return CustomButton(
      text: 'Cadastrar',
      isLoading: _isLoading,
      onPressed: _handleRegister,
      backgroundColor: Color(0xFFEC7023),
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: GestureDetector(
        onTap: _navigateToLogin,
        child: RichText(
          text: TextSpan(
            style: TextStyleHelper.instance.body14Poppins.copyWith(
              color: appTheme.colorFF6666,
            ),
            children: [
              TextSpan(text: 'Já tem uma conta? '),
              TextSpan(
                text: 'Faça login',
                style: TextStyleHelper.instance.body14Poppins.copyWith(
                  color: Color(0xFFEC7023),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
