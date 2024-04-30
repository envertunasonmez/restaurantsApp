import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/onboarding_screens/onboarding_second_screen.dart';

class OnboardingPageFirst extends StatefulWidget {
  const OnboardingPageFirst({super.key});

  @override
  State<OnboardingPageFirst> createState() => _OnboardingPageFirstState();
}

class _OnboardingPageFirstState extends State<OnboardingPageFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 72.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/tracking_and_maps.png'),
              8.yh,
              Text(
                'Nearby restaurants',
                style: Get.theme.textTheme.labelLarge!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
              2.yh,
              Text(
                "You don't have to go far to  find a good restaurant, we have provided all the restaurants that is near you",
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
                      Get.to(OnboardingSecondPage());
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
