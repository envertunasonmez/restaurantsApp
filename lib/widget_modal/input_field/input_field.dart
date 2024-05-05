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
    this.suffix,
    this.onChanged,
  });

  final TextEditingController controller;
  final String title;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? isObscure;
  final Widget? suffix;

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
          onChanged: onChanged,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          cursorHeight: 2.h,
          style: Get.theme.textTheme.labelMedium!.copyWith(
            color: ColorConstants.black,
          ),
          obscureText: isObscure ?? false,
          decoration: InputDecoration(
            suffixIcon: suffix,
            isDense: false,
            contentPadding: 4.w.pAll,
            hintText: hint,
            hintStyle: Get.theme.textTheme.labelSmall!.copyWith(
              color: ColorConstants.grey.withOpacity(0.4),
            ),
            errorStyle: Get.theme.textTheme.labelSmall!.copyWith(
              color: Get.theme.colorScheme.error,
            ),
            border: AppStyleHelper.inputBorderStyle(),
            focusedBorder: AppStyleHelper.inputBorderStyle(),
            enabledBorder: AppStyleHelper.inputBorderStyle(),
            constraints: BoxConstraints(
              minWidth: 100.w,
              minHeight: 2.h,
              maxHeight: 12.h,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
