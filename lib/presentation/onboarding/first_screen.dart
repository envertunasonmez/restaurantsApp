import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';
import 'package:restaurant_app/route/routes.dart';

class OnBoardingPageFirst extends StatelessWidget {
  const OnBoardingPageFirst({super.key});

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
              onTap: ()=>Get.toNamed(AppPages.authMain,),
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
            StaticAssets.onBoardingFirstImage,
          ),
          8.yh,
          Text(
            'Nearby restaurants',
            style: Get.theme.textTheme.labelLarge!.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          2.yh,
          Text(
            "You don't have to go far to  find a good restaurant, we have provided all the restaurants that is near you",
            style: Get.theme.textTheme.labelSmall!.copyWith(
              color: ColorConstants.grey.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Skip',
                style: Get.theme.textTheme.labelSmall,
              ),
              const AppIndicator(
                index: 0,
              ),
              GestureDetector(
                onTap: () => Get.toNamed(
                  AppPages.onBoardingPageSecond,
                ),
                child: SvgPicture.asset(
                  StaticAssets.arrowRight,
                ),
              ),
            ],
          ),
          4.yh,
        ],
      ),
    );
  }
}

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 11.5.w,
      child: Row(
        children: [
          Container(
            height: 2.5.w,
            width: 2.5.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100 * 100),
                color: index == 0
                    ? Get.theme.colorScheme.primary
                    : Colors.transparent,
                border: Border.all(
                  color: index == 0
                      ? Colors.transparent
                      : Get.theme.colorScheme.primary,
                )),
          ),
          2.xw,
          Container(
            height: 2.5.w,
            width: 2.5.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100 * 100),
                color: index == 1
                    ? Get.theme.colorScheme.primary
                    : Colors.transparent,
                border: Border.all(
                  color: index == 1
                      ? Colors.transparent
                      : Get.theme.colorScheme.primary,
                )),
          ),
          2.xw,
          Container(
            height: 2.5.w,
            width: 2.5.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100 * 100),
                color: index == 2
                    ? Get.theme.colorScheme.primary
                    : Colors.transparent,
                border: Border.all(
                  color: index == 2
                      ? Colors.transparent
                      : Get.theme.colorScheme.primary,
                )),
          )
        ],
      ),
    );
  }
}
