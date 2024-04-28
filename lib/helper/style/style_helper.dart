import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/radius.dart';

class AppStyleHelper {
  //Input field border style
  static InputBorder inputBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppRadius.inputFieldRadius,
      ),
      borderSide: BorderSide(
        color: ColorConstants.grey.withOpacity(0.4),
      ),
    );
  }
}
