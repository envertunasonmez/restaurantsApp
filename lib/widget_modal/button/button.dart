import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

import '../../core/constant/color.dart';
import '../../core/constant/radius.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.text,
    required this.onTap,
    this.isInActive = false,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final void Function() onTap;
  final bool? isInActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
          color: isInActive!
              ? ColorConstants.grey
              : (backgroundColor ?? Get.theme.colorScheme.primary),
          borderRadius: BorderRadius.circular(
            AppRadius.buttonRadius,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Get.theme.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: isInActive!
                  ? ColorConstants.grey
                  : (textColor ?? Get.theme.colorScheme.secondary),
            ),
          ),
        ),
      ),
    );
  }
}
