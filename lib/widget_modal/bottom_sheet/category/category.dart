import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/radius.dart';

class BottomSheetCategory extends StatelessWidget {
  const BottomSheetCategory({
    super.key,
    required this.text,
    required this.onTap,
    required this.isActive,
  });

  final String text;
  final void Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: Get.theme.textTheme.labelMedium!.copyWith(
              color: isActive
                  ? Get.theme.colorScheme.primary
                  : ColorConstants.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          1.yh,
          if (isActive)
            Container(
              height: 0.3.h,
              width: 16.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppRadius.bottomSheetRadius,
                ),
                color: Get.theme.colorScheme.primary,
              ),
            )
        ],
      ),
    );
  }
}
