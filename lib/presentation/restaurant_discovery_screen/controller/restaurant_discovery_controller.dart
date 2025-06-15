import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/category_model.dart';
import '../models/restaurant_model.dart';

class RestaurantDiscoveryController extends GetxController {
  late TextEditingController searchController;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<RestaurantModel> restaurants = <RestaurantModel>[].obs;
  RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    initializeData();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void initializeData() {
    categories.value = [
      CategoryModel(
        title: 'Todos'.obs,
        isSelected: true.obs,
        hasIcon: true.obs,
      ),
      CategoryModel(
        title: 'Hamburguer'.obs,
        isSelected: false.obs,
        hasIcon: false.obs,
      ),
      CategoryModel(
        title: 'Pizza'.obs,
        isSelected: false.obs,
        hasIcon: false.obs,
      ),
      CategoryModel(
        title: 'Churrasco'.obs,
        isSelected: false.obs,
        hasIcon: false.obs,
      ),
    ];

    restaurants.value = [
      RestaurantModel(
        name: 'Show Burguer'.obs,
        rating: '4.4'.obs,
        location: 'Coqueiral de Itaparica, Vila Velha - ES'.obs,
        imagePath: ImageConstant.imgShowburguer1.obs,
        isFeatured: true.obs,
        description:
            'O Show Burguer é um restaurante especializado em hambúrgueres artesanais, com opções deliciosas e ingredientes de alta qualidade. Ambiente aconchegante e atendimento diferenciado.'
                .obs,
        telefone: '(27) 99999-8888'.obs,
        latitude: (-20.3639).obs,
        longitude: (-40.2930).obs,
      ),
      RestaurantModel(
        name: 'Vila Rusticana'.obs,
        rating: '4.6'.obs,
        location: 'Praia da Costa, Vila Velha - ES'.obs,
        imagePath: ImageConstant.img5.obs,
        isFeatured: false.obs,
        description:
            'Restaurante com gastronomia italiana autêntica, ambiente rústico e aconchegante. Especializado em massas caseiras e vinhos selecionados.'
                .obs,
        telefone: '(27) 3333-4444'.obs,
        latitude: (-20.3382).obs,
        longitude: (-40.2885).obs,
      ),
      RestaurantModel(
        name: 'Argento Parrilha'.obs,
        rating: '4.5'.obs,
        location: 'Centro de Vila Velha, Vila Velha - ES'.obs,
        imagePath: ImageConstant.imgArgentoparrilha1.obs,
        isFeatured: false.obs,
        description:
            'Churrascaria argentina com carnes nobres e cortes especiais. Ambiente sofisticado com vista para o mar e carta de vinhos premium.'
                .obs,
        telefone: '(27) 2222-1111'.obs,
        latitude: (-20.3297).obs,
        longitude: (-40.2925).obs,
      ),
    ];
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;

    for (int i = 0; i < categories.length; i++) {
      categories[i].isSelected?.value = i == index;
    }

    categories.refresh();
  }

  void onRestaurantTap(RestaurantModel restaurant) {
    Get.toNamed(AppRoutes.restaurantDetailsScreen, arguments: restaurant);
  }

  void onBottomNavTap(int index) {
    switch (index) {
      case 0:
        // Home - current screen, no action needed
        break;
      case 1:
        // Map navigation - redirect to map explorer with first restaurant
        if (restaurants.isNotEmpty) {
          Get.toNamed(AppRoutes.restaurantMapExplorerScreen,
              arguments: restaurants.first);
        }
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
              _performLogout();
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

  void _performLogout() {
    // Clear any user data if needed
    // PrefUtils().clearPreferencesData(); // Uncomment if you want to clear preferences

    // Navigate to login screen and clear all previous routes
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  void onSearchChanged(String value) {
    // Implement search functionality
  }
}
