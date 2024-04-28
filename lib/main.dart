import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/auth/main/auth_main.dart';
import 'package:restaurant_app/route/routes.dart';

import 'controller/theme/theme_controller.dart';
import 'helper/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //App controllers and cache have been initializing here
  await App.init();
  final themeController = Get.put(ThemeController());
  Future.delayed(
    10.milliseconds,
    () => runApp(
      GetMaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        home: const AuthMainScreen(),
        theme: themeController.lightTheme,
        routes: AppRoutes.routes,
      ),
    ),
  );
}
