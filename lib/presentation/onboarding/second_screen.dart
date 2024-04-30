import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';
import '../../route/routes.dart';
import 'first_screen.dart';

class OnBoardingPageSecond extends StatelessWidget {
  const OnBoardingPageSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          2.yh,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.toNamed(
                AppPages.authMain,
              ),
              child: Text(
                'Skip',
                style: Get.theme.textTheme.labelSmall!.copyWith(
                  color: ColorConstants.grey,
                ),
              ),
            ),
          ),
          const Spacer(),
          Image.asset(
            StaticAssets.onBoardingSecondImage,
          ),
          8.yh,
          Text(
            'Select the Favorites Menu',
            style: Get.theme.textTheme.labelLarge!.copyWith(
                color: ColorConstants.black, fontWeight: FontWeight.bold),
          ),
          2.yh,
          Text(
            "Now eat well, don't leave the house,You can choose your favorite food only with one click",
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
                        AppPages.onBoardingPageThird,
                      ),
                      child: SvgPicture.asset(
                        StaticAssets.arrowRight,
                      ),
                    ),
                  ),
                ),
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: AppIndicator(
                      index: 1,
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
