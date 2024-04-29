import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/auth/main/auth_main.dart';
import 'package:restaurant_app/widget_modal/button/button.dart';
import 'package:restaurant_app/widget_modal/input_field/input_field.dart';

class ChangeNewPassword extends StatefulWidget {
  const ChangeNewPassword({super.key});

  @override
  State<ChangeNewPassword> createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  TextEditingController createNewPassword = TextEditingController();
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
              'Change New Password',
              style: Get.theme.textTheme.labelLarge!.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enter a different password with the previous',
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: ColorConstants.grey.withOpacity(0.6),
              ),
            ),
            4.yh,
            AppInputField(
              controller: createNewPassword,
              title: 'New Password',
              hint: '***** ****** *****',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            2.yh,
            AppInputField(
              controller: createNewPassword,
              title: 'Confarm Password',
              hint: '***** ****** *****',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            36.yh,
            Padding(
              padding: 36.pAll,
              child: AppButton(
                text: 'Submit',
                onTap: () {},
                isInActive: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createNewPasswordSubmit() {
    Get.to(const AuthMainScreen());
  }
}
