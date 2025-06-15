import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import '../registration_screen/registration_screen.dart';
import './widgets/custom_button.dart';
import './widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Simulate login process
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });
        Get.offAllNamed(AppRoutes.restaurantDiscoveryScreen);
      });
    }
  }

  void _navigateToRegister() {
    Get.to(() => RegistrationScreen());
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
              SizedBox(height: 60.h),
              _buildLogo(),
              SizedBox(height: 48.h),
              _buildLoginContainer(),
              SizedBox(height: 40.h),
            ],
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

  Widget _buildLoginContainer() {
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
                    'Login',
                    style: TextStyleHelper.instance.title19BoldPoppins.copyWith(
                      fontSize: 24.fSize,
                      color: Color(0xFFEC7023),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Entre na sua conta para continuar',
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
            _buildLoginForm(),
            SizedBox(height: 32.h),
            _buildLoginButton(),
            SizedBox(height: 24.h),
            _buildRegisterLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
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
              return 'Por favor, digite seu usuário';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        Text(
          'Senha',
          style: TextStyleHelper.instance.title16BoldPoppins.copyWith(
            fontSize: 14.fSize,
            color: appTheme.blackCustom,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          controller: _passwordController,
          hintText: 'Digite sua senha',
          isPassword: true,
          isPasswordVisible: _isPasswordVisible,
          onPasswordToggle: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, digite sua senha';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return CustomButton(
      text: 'Entrar',
      isLoading: _isLoading,
      onPressed: _handleLogin,
      backgroundColor: Color(0xFFEC7023),
    );
  }

  Widget _buildRegisterLink() {
    return Center(
      child: GestureDetector(
        onTap: _navigateToRegister,
        child: RichText(
          text: TextSpan(
            style: TextStyleHelper.instance.body14Poppins.copyWith(
              color: appTheme.colorFF6666,
            ),
            children: [
              TextSpan(text: 'Não tem uma conta? '),
              TextSpan(
                text: 'Cadastre-se',
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
