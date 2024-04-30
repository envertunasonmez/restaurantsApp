import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';

import '../../route/routes.dart';
import 'first_screen.dart';

class OnBoardingPageThird extends StatelessWidget {
  const OnBoardingPageThird({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            StaticAssets.onBoardingThirdImage,
          ),
          8.yh,
          Text(
            'Good food at a cheap price',
            style: Get.theme.textTheme.labelLarge!.copyWith(
                color: ColorConstants.black, fontWeight: FontWeight.bold),
          ),
          2.yh,
          Text(
            "You can eat at expensive restaurants with affordable price",
            style: Get.theme.textTheme.labelSmall!.copyWith(
              color: ColorConstants.grey.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        StaticAssets.arrowLeft,
                        height: 3.h,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(
                        AppPages.authMain,
                      ),
                      child: Text(
                        "Let's start",
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                          color: Get.theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: AppIndicator(
                      index: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          4.yh,
        ],
      ),
    );
  }
}
