import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/auth/auth_controller.dart';
import 'package:restaurant_app/controller/bottomNavBar/bottom_nav_bar.dart';
import 'package:restaurant_app/controller/menu/menu.dart';
import '../cache/cache.dart';
import '../controller/theme/theme_controller.dart';

class App {
  static Future<void> init() async {
    await AppCache.init();
    await PreparerControllers.prepareController();
  }
}

class PreparerControllers {
  static Future<void> prepareController() async {
    Get.put(ThemeController());
    Get.put(AuthController());
    Get.put(AppMenuController());
    Get.put(BottomNavBarController());
  }
}
