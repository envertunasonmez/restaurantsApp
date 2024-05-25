
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/radius.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

class AppSnackBar {
  static void show({
    required int statusCode,
    required String successMessage,
    String? errorMessage,
  }) {
    late GetSnackBar getSnackBar;
    errorMessage ??= 'Somethings went wrong!';
    //Success
    if (statusCode == 200) {
      getSnackBar = GetSnackBar(
        title: 'Success',
        message: successMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.primary,
      );
    }
    //Create
    else if (statusCode == 201) {
      getSnackBar = GetSnackBar(
        title: 'Success',
        message: successMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.primary,
      );
    }
    //Bad Request
    else if (statusCode == 400) {
      getSnackBar = GetSnackBar(
        title: 'Bad Request',
        message: errorMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }
    //Unauthorized
    else if (statusCode == 401) {
      getSnackBar = GetSnackBar(
        title: 'Unauthorized',
        message: errorMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }
    //Forbidden
    else if (statusCode == 403) {
      getSnackBar = GetSnackBar(
        title: 'Forbidden',
        message: errorMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }
    //Not Found
    else if (statusCode == 404) {
      getSnackBar = GetSnackBar(
        title: 'Not Found',
        message: errorMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }
    //Internal Server Error
    else if (statusCode == 500) {
      getSnackBar = GetSnackBar(
        title: 'Internal Server Error',
        message: errorMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }
    else if (statusCode == 906) {
      getSnackBar = GetSnackBar(
        title: 'User not found',
        message: errorMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }
    //Else
    else {
      getSnackBar = GetSnackBar(
        title: statusCode.toString(),
        message: errorMessage,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        borderRadius: AppRadius.buttonRadius,
        duration: 3.seconds,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }

    Get.showSnackbar(
      getSnackBar,
    );
  }
}
