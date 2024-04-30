import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';
import 'package:restaurant_app/route/routes.dart';
import 'package:restaurant_app/widget_modal/button/button.dart';
import 'package:restaurant_app/widget_modal/input_field/input_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  TextEditingController forgetPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobile: Column(
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
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(
                          AppPages.authMain,
                        ),
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
              onTap: () => Get.toNamed(
                AppPages.backEmailScreen,
              ),
              isInActive: true,
            ),
          ),
        ],
      ),
    );
  }
}
