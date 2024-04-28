import 'package:flutter/material.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/radius.dart';

class BottomSheetHandler extends StatelessWidget {
  const BottomSheetHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.75.h,
      width: 12.w,
      decoration: BoxDecoration(
        color: ColorConstants.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(
          AppRadius.bottomSheetRadius,
        ),
      ),
    );
  }
}
