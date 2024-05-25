import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/radius.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';

import '../../controller/menu/menu.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  @override
  void initState() {
    var menuController = Get.find<AppMenuController>();
    menuController.getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      hasScrollable: true,
      mobile: Column(
        children: [
          SizedBox(
            width: 100.w,
            height: 4.h,
            child: Stack(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      StaticAssets.arrowLeft,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Details Restaurant',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          2.yh,
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.theme.colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(
                AppRadius.cardRadius,
              ),
            ),
            child: Padding(
              padding: 4.w.pAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aspava',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: ColorConstants.grey,
                    ),
                  ),
                  1.yh,
                  Row(
                    children: [
                      SvgPicture.asset(
                        StaticAssets.location,
                      ),
                      1.xw,
                      Text(
                        'Ankara, Turkey',
                        style: Get.theme.textTheme.labelSmall!.copyWith(
                          color: ColorConstants.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20.h,
                    width: 100.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppRadius.cardRadius,
                      ),
                      child: Image.asset(
                        StaticAssets.hamburger,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  1.yh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                StaticAssets.clock,
                              ),
                              1.xw,
                              Text(
                                'Open Today',
                                style: Get.theme.textTheme.labelSmall!.copyWith(
                                  color: ColorConstants.grey,
                                ),
                              ),
                            ],
                          ),
                          0.5.yh,
                          Text(
                            '10:30 AM - 23:30 PM',
                            style: Get.theme.textTheme.labelSmall!.copyWith(
                              color: ColorConstants.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            StaticAssets.mapRoute,
                          ),
                          1.xw,
                          Text(
                            'Visit the Restaurant',
                            style: Get.theme.textTheme.labelSmall!.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          2.yh,
          GetBuilder<AppMenuController>(
              id: 'menuController',
              builder: (mc) {
                return mc.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Get.theme.colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppRadius.cardRadius,
                          ),
                        ),
                        child: Padding(
                          padding: 4.w.pAll,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Menu',
                                style:
                                    Get.theme.textTheme.labelMedium!.copyWith(
                                  color: ColorConstants.grey,
                                ),
                              ),
                              1.yh,
                              Expanded(
                                child: ListView.builder(
                                    itemCount: mc.menu.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        margin: 1.h.pBottom,
                                        height: 8.h,
                                        width: 100.w,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              StaticAssets.restaurant,
                                            ),
                                            4.xw,
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    mc.menu[index].name ?? '',
                                                    style: Get.theme.textTheme
                                                        .labelMedium!
                                                        .copyWith(
                                                      color:
                                                          ColorConstants.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    mc.menu[index]
                                                            .ingredients ??
                                                        '',
                                                    style: Get.theme.textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                      color:
                                                          ColorConstants.grey,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        StaticAssets.money,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                          Get.theme.colorScheme
                                                              .primary,
                                                          BlendMode.srcIn,
                                                        ),
                                                        height: 4.w,
                                                      ),
                                                      2.xw,
                                                      SizedBox(
                                                        width: 32.w,
                                                        child: Text(
                                                          '${mc.menu[index].price ?? ''} \$',
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                            color:
                                                                ColorConstants
                                                                    .grey,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () => mc.order(
                                                          id: mc.menu[index]
                                                                  .id ??
                                                              -1,
                                                        ),
                                                        child: Container(
                                                          height: 3.h,
                                                          width: 20.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Get
                                                                .theme
                                                                .colorScheme
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              AppRadius
                                                                  .cardRadius,
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Order',
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
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      );
              }),
        ],
      ),
    );
  }
}
