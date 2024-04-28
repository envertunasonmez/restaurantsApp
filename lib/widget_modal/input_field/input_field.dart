import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

import '../../core/constant/color.dart';
import '../../helper/style/style_helper.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    this.validator,
    this.keyboardType,
    this.isObscure,
  });

  final TextEditingController controller;
  final String title;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: 2.w.pLeft,
          child: Text(
            title,
            style: Get.theme.textTheme.labelMedium!.copyWith(
              color: ColorConstants.inputTitleColor,
            ),
          ),
        ),
        1.yh,
        TextFormField(
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          cursorHeight: 2.h,
          style: Get.theme.textTheme.labelMedium!.copyWith(
            color: ColorConstants.black,
          ),
          obscureText: isObscure ?? false,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: 4.w.pAll,
            hintText: hint,
            hintStyle: Get.theme.textTheme.labelSmall!.copyWith(
              color: ColorConstants.grey.withOpacity(0.4),
            ),
            border: AppStyleHelper.inputBorderStyle(),
            focusedBorder: AppStyleHelper.inputBorderStyle(),
            enabledBorder: AppStyleHelper.inputBorderStyle(),
            constraints: BoxConstraints(
              minWidth: 100.w,
              minHeight: 2.h,
              maxHeight: 6.h,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
