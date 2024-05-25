import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/auth/forget_password/forget_password.dart';

import 'package:restaurant_app/presentation/auth/forget_password/success.dart';
import 'package:restaurant_app/presentation/auth/main/auth_main.dart';
import 'package:restaurant_app/presentation/home/home_screen.dart';
import 'package:restaurant_app/presentation/onboarding/first_screen.dart';
import 'package:restaurant_app/presentation/restaurant_detail/restaurant_detail_screen.dart';

import '../presentation/auth/forget_password/back_email.dart';
import '../presentation/onboarding/second_screen.dart';
import '../presentation/onboarding/third_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppPages.authMain: (_) => const AuthMainScreen(),
    AppPages.home: (_) => const HomeScreen(),
    AppPages.onBoardingPageFirst: (_) => const OnBoardingPageFirst(),
    AppPages.onBoardingPageSecond: (_) => const OnBoardingPageSecond(),
    AppPages.onBoardingPageThird: (_) => const OnBoardingPageThird(),
    AppPages.backEmailScreen: (_) => const BackEmailScreen(),
    AppPages.successScreen: (_) => const SuccessScreen(),
    AppPages.forgetPassword: (_) => ForgetPasswordPage(),
    AppPages.restaurantDetailScreen: (_) => const RestaurantDetailScreen(),
  };
}

class AppPages {
  static String authMain = '/authMain';
  static String home = '/home';
  static String onBoardingPageFirst = '/onBoardingPageFirst';
  static String onBoardingPageSecond = '/onBoardingPageSecond';
  static String onBoardingPageThird = '/onBoardingPageThird';
  static String forgetPassword = '/forgetPassword';
  static String backEmailScreen = '/backEmailScreen';
  static String successScreen = '/successScreen';
  static String restaurantDetailScreen = '/restaurantDetailScreen';
}
