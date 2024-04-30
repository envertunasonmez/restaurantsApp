import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/onboarding_screens/onboarding_third_screen.dart';

class OnboardingSecondPage extends StatelessWidget {
  const OnboardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 72.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/order_illustration.png'),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(color: ColorConstants.primary),
                    height: 4.h,
                    width: 12.w,
                    child: Center(
                      child: Text(
                        'Skip',
                        style: Get.theme.textTheme.labelSmall!.copyWith(
                          color: ColorConstants.black,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(OnboardingPageThird());
                    },
                    icon: Icon(Icons.arrow_right_alt_rounded),
                    color: ColorConstants.primary,
                    iconSize: 6.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
