import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

import 'package:restaurant_app/presentation/auth/forget_password/back_email.dart';
import 'package:restaurant_app/presentation/auth/main/auth_main.dart';
import 'package:restaurant_app/widget_modal/button/button.dart';
import 'package:restaurant_app/widget_modal/input_field/input_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController forgetPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 36.pAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.yh,
            Text(
              'Forget Password',
              style: Get.theme.textTheme.labelLarge!.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enter your registered email below',
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: ColorConstants.grey.withOpacity(0.6),
              ),
            ),
            4.yh,
            AppInputField(
              controller: forgetPassword,
              title: 'Email address',
              hint: 'example@gmail.com',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            1.yh,
            Row(
              children: [
                Text(
                  'Remember the password? ',
                  style: Get.theme.textTheme.labelSmall!.copyWith(
                    color: ColorConstants.grey.withOpacity(0.8),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = onTapSignIn,
                    text: ' Sign In',
                    style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            44.yh,
            Padding(
              padding: 36.pAll,
              child: AppButton(
                text: 'Submit',
                onTap: () {
                  Get.to(BackEmailPage());
                },
                isInActive: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapSignIn() {
    Get.to(AuthMainScreen());
  }
}
