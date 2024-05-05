import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restaurant_app/presentation/onboarding/first_screen.dart';
import 'package:restaurant_app/route/routes.dart';

import 'controller/theme/theme_controller.dart';
import 'helper/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //App controllers and cache have been initializing here
  await App.init();
  final themeController = Get.put(ThemeController());
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  Future.delayed(
    10.milliseconds,
    () => runApp(
      GetMaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        home: const OnBoardingPageFirst(),
        theme: themeController.lightTheme,
        routes: AppRoutes.routes,
      ),
    ),
  );
}
