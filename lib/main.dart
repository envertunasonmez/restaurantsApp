import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/auth/main/auth_main.dart';
import 'package:restaurant_app/presentation/home/home_screen.dart';
import 'package:restaurant_app/presentation/main/main_screen.dart';
import 'package:restaurant_app/presentation/restaurant_detail/restaurant_detail_screen.dart';
import 'package:restaurant_app/route/routes.dart';

import 'controller/theme/theme_controller.dart';
import 'firebase_options.dart';
import 'helper/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //App controllers and cache have been initializing here
  await App.init();
  final themeController = Get.put(ThemeController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future.delayed(
    10.milliseconds,
    () => runApp(
      GetMaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        home:  MainScreen(),
        theme: themeController.lightTheme,
        routes: AppRoutes.routes,
      ),
    ),
  );
}
