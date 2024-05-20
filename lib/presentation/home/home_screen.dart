import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/auth/auth_controller.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/radius.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';

var ac = Get.find<AuthController>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        hasAppBar: true,
        hasScrollable: true,
        mobile: Column(
          children: [
            2.yh,
            SizedBox(
              height: 18.h,
              width: 100.w,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: 4.w.pAll,
                      child: Stack(
                        children: [
                          Container(
                            width: 70.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFF9F06),
                                  Color(0xFFFFE1B4),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                AppRadius.cardRadius * 3,
                              ),
                            ),
                            child: Padding(
                              padding: 4.w.pAll,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    StaticAssets.burgerKingLogo,
                                  ),
                                  Text(
                                    'Flash Offer',
                                    style: Get.theme.textTheme.labelMedium!
                                        .copyWith(
                                      color: Get.theme.colorScheme.secondary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                    child: Text(
                                      'We are here with the best deserts intown.',
                                      style: Get.theme.textTheme.labelSmall!
                                          .copyWith(
                                        color: Get.theme.colorScheme.secondary,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: -12.w,
                            bottom: 0,
                            child: Image.asset(
                              StaticAssets.hamburger,
                              height: 28.w,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            2.yh,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today New Arivable',
                      style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                      ),
                    ),
                    Text(
                      'Best of the today food list update',
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                        color: ColorConstants.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'See All',
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                        color: ColorConstants.grey,
                      ),
                    ),
                    2.xw,
                    SvgPicture.asset(
                      StaticAssets.seeAllArrow,
                    ),
                  ],
                ),
              ],
            ),
            2.yh,
            SizedBox(
              height: 26.h,
              width: 90.w,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: 4.w.pRight,
                      height: 26.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Get.theme.colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppRadius.cardRadius * 2,
                        ),
                      ),
                      child: Padding(
                        padding: 2.w.pAll,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  AppRadius.cardRadius * 2,
                                ),
                                topRight: Radius.circular(
                                  AppRadius.cardRadius * 2,
                                ),
                              ),
                              child: Image.asset(
                                StaticAssets.chickenBiryani,
                              ),
                            ),
                            2.yh,
                            Text(
                              'Chicken Biryani',
                              style: Get.theme.textTheme.labelMedium!.copyWith(
                                color: ColorConstants.black,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  StaticAssets.location,
                                  height: 4.w,
                                ),
                                2.xw,
                                Expanded(
                                  child: Text(
                                    'Ambrosia Hotel & Restaurant',
                                    style: Get.theme.textTheme.labelSmall!
                                        .copyWith(
                                      color: ColorConstants.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            4.yh,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Restaurant',
                      style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                      ),
                    ),
                    Text(
                      'Check your city Near by Restaurant',
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                        color: ColorConstants.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'See All',
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                        color: ColorConstants.grey,
                      ),
                    ),
                    2.xw,
                    SvgPicture.asset(
                      StaticAssets.seeAllArrow,
                    ),
                  ],
                ),
              ],
            ),
            2.yh,
            SizedBox(
              height: 26.h,
              width: 90.w,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: 4.w.pBottom,
                      height: 12.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Get.theme.colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppRadius.cardRadius * 2,
                        ),
                      ),
                      child: SizedBox(
                        height: 8.h,
                        width: 60.w,
                        child: Row(
                          children: [
                            4.xw,
                            Padding(
                              padding: 4.w.pAll,
                              child: Image.asset(
                                StaticAssets.restaurant,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hotel Zaman Restaurant',
                                    style: Get.theme.textTheme.labelMedium!
                                        .copyWith(
                                      color: ColorConstants.black,
                                    ),
                                  ),
                                  1.yh,
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        StaticAssets.location,
                                        height: 4.w,
                                      ),
                                      2.xw,
                                      SizedBox(
                                        width: 32.w,
                                        child: Text(
                                          'Ambrosia Hotel & Restaurant',
                                          style: Get.theme.textTheme.labelSmall!
                                              .copyWith(
                                            color: ColorConstants.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 3.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                          color: Get.theme.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(
                                            AppRadius.cardRadius,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Book',
                                            style: Get
                                                .theme.textTheme.labelSmall!
                                                .copyWith(
                                              color: Get
                                                  .theme.colorScheme.secondary,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
