import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/constant/radius.dart';
import '../../core/constant/text_style.dart';
import '../base/base_controller.dart';

class ThemeController extends BaseController {
  ThemeData get lightTheme => ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    colorScheme: ColorScheme(
      background: ColorConstants.background,
      brightness: Brightness.light,
      primary: ColorConstants.primary,
      onPrimary: ColorConstants.primary,
      secondary: ColorConstants.secondary,
      onSecondary: ColorConstants.secondary,
      error: Colors.red,
      onError: Colors.red,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: CustomTextStyles.titleLarge,
      titleMedium: CustomTextStyles.titleMedium,
      titleSmall: CustomTextStyles.titleSmall,
      bodyLarge: CustomTextStyles.bodyLarge,
      bodyMedium: CustomTextStyles.bodyMedium,
      bodySmall: CustomTextStyles.bodySmall,
      labelLarge: CustomTextStyles.labelLarge,
      labelMedium: CustomTextStyles.labelMedium,
      labelSmall: CustomTextStyles.labelSmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorConstants.primary),
        shadowColor: MaterialStateProperty.all(ColorConstants.primary),
        textStyle: MaterialStateProperty.all(
          Get.theme.textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.buttonRadius),
          ),
        ),
      ),
    ),
  );

  @override
  void onInit() {
    builderId = 'themeController';
    super.onInit();
  }
}
