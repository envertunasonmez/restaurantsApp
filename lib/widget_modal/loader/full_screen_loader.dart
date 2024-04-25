import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key, this.progressColor});

  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Center(
          child: CircularProgressIndicator(
            color: progressColor ?? Get.theme.colorScheme.primary,
          )),
    );
  }
}
