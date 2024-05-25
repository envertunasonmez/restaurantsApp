import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';

import '../../core/constant/color.dart';
import '../../core/constant/radius.dart';
import '../../core/constant/static_asset.dart';
import '../../route/routes.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobile: Column(
        children: [
          2.yh,
          Center(
            child: Text(
              'Booking History',
              style: Get.theme.textTheme.labelMedium!.copyWith(
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          2.yh,
          SizedBox(
            height: 26.h,
            width: 90.w,
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(
                      AppPages.restaurantDetailScreen,
                    ),
                    child: Container(
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
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
