import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/auth/forget_password/forget_password.dart';
import 'package:restaurant_app/widget_modal/button/button.dart';

import '../../onboarding/first_screen.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 36.pAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            32.yh,
            Image.asset('assets/icons/success_icon.png'),
            Text(
              'Success',
              style: Get.theme.textTheme.bodyMedium!.copyWith(
                  color: ColorConstants.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Congratulations your password has been changed,",
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: ColorConstants.grey.withOpacity(0.8),
              ),
            ),
            16.yh,
            Padding(
              padding: 36.pAll,
              child: AppButton(
                text: 'Sign In',
                onTap: () {
                  Get.to(const OnBoardingPageFirst());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void reSubmit() {
    Get.to(const ForgetPasswordPage());
  }
}
