import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/auth/forget_password/forget_password.dart';

import 'package:restaurant_app/widget_modal/button/button.dart';

class BackEmailPage extends StatelessWidget {
  const BackEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 36.pAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            40.yh,
            Text(
              'Success',
              style: Get.theme.textTheme.bodyMedium!.copyWith(
                  color: ColorConstants.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please check your email for create a new password",
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: ColorConstants.grey.withOpacity(0.8),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Can't get email? ",
                  style: Get.theme.textTheme.labelSmall!.copyWith(
                    color: ColorConstants.grey.withOpacity(0.8),
                  ),
                ),
                4.yh,
                Text.rich(
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = reSubmit,
                    text: ' Resubmit',
                    style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            16.yh,
            Padding(
              padding: 36.pAll,
              child: AppButton(
                text: 'Back Email',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void reSubmit() {
    Get.to(ForgetPasswordPage());
  }
}
