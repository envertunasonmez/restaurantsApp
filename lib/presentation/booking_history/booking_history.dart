import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/auth/auth_controller.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';

import '../../core/constant/color.dart';
import '../../core/constant/radius.dart';
import '../../core/constant/static_asset.dart';
import '../../route/routes.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  void initState() {
    Future.delayed(100.milliseconds, () async {
      var au = Get.find<AuthController>();
      await au.getBookedRestaurants();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        id: 'authController',
        builder: (ac) {
          return BaseScreen(
            mobile: ac.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
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
                            itemCount: ac.bookedRestaurantList.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  ac
                                      .addRestaurantToBookHistory(
                                          id: ac.bookedRestaurantList[index].id
                                              .toString())
                                      .then((value) {
                                    Get.toNamed(
                                      AppPages.restaurantDetailScreen,
                                      arguments: ac.bookedRestaurantList[index],
                                    );
                                  });
                                },
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
                                          child: ac.bookedRestaurantList[index]
                                                      .imageNetworkPath ==
                                                  null
                                              ? Image.asset(
                                                  StaticAssets.restaurant)
                                              : Image.network(ac
                                                  .bookedRestaurantList[index]
                                                  .imageNetworkPath!),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                ac.bookedRestaurantList[index]
                                                        .name ??
                                                    'Restaurant',
                                                style: Get.theme.textTheme
                                                    .labelMedium!
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
                                                      '${ac.bookedRestaurantList[index].city}/${ac.restaurantList[index].country}',
                                                      style: Get.theme.textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                        color:
                                                            ColorConstants.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 3.h,
                                                    width: 20.w,
                                                    decoration: BoxDecoration(
                                                      color: Get.theme
                                                          .colorScheme.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        AppRadius.cardRadius,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Book',
                                                        style: Get
                                                            .theme
                                                            .textTheme
                                                            .labelSmall!
                                                            .copyWith(
                                                          color: Get
                                                              .theme
                                                              .colorScheme
                                                              .secondary,
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
        });
  }
}
