import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension NumX on num {
  double get h => (Get.height * this) / 100;

  double get w => (Get.width * this) / 100;

  //White Spaces//

  // yh is meaning the vertical space (using screen height)
  // yw is meaning the vertical space (using screen width)
  SizedBox get yh => SizedBox(height: (Get.height * this) / 100);

  SizedBox get yw => SizedBox(height: (Get.width * this) / 100);

  // xh is meaning the horizontal space (using screen height)
  // xw is meaning the horizontal space (using screen width)
  SizedBox get xh => SizedBox(width: (Get.height * this) / 100);

  SizedBox get xw => SizedBox(width: (Get.width * this) / 100);

  //Paddings//
  EdgeInsetsGeometry get pH => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsetsGeometry get pV => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsetsGeometry get pLeft => EdgeInsets.only(left: toDouble());
  EdgeInsetsGeometry get pTop => EdgeInsets.only(top: toDouble());
  EdgeInsetsGeometry get pBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsetsGeometry get pRight => EdgeInsets.only(right: toDouble());

  EdgeInsetsGeometry get pAll => EdgeInsets.all(toDouble());
}
