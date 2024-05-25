import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/radius.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import '../../core/constant/padding.dart';
import '../../responsive/responsive.dart';
import '../../widget_modal/loader/full_screen_loader.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({
    Key? key,
    this.hasScrollable = false,
    this.safeArea = true,
    this.hasDrawer = true,
    this.isLoading = false,
    this.customLoader,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.watch,
    this.backgroundColor,
    this.hasScreenDefaultPadding = true,
    this.hasAppBar = false,
  }) : super(key: key);

  final bool? hasScrollable;
  final bool? hasAppBar;
  final bool? safeArea;
  final bool? hasDrawer;
  final bool? isLoading;
  final bool? hasScreenDefaultPadding;
  final Widget? customLoader;
  final Color? backgroundColor;

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? watch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar!
          ? AppBar(
              title: Text(
                'Turkey,Ankara',
                style: Get.theme.textTheme.labelMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              leading: Padding(
                padding: 3.w.pAll,
                child: SvgPicture.asset(
                  StaticAssets.arrowLeft,
                ),
              ),
              actions: [
                Padding(
                  padding: 4.w.pRight,
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100 * 100),
                    ),
                    child: Image.asset(
                      StaticAssets.dummyAvatar,
                    ),
                  ),
                )
              ],
            )
          : null,
      extendBody: true,
      backgroundColor: backgroundColor ?? Get.theme.colorScheme.background,
      body: Padding(
        padding: hasScreenDefaultPadding!
            ? AppPadding.screenPadding
            : EdgeInsets.zero,
        child: Stack(
          children: [
            safeArea!
                ? SafeArea(
                    child: hasScrollable!
                        ? SingleChildScrollView(
                            child: AppResponsive(
                              mobile: mobile,
                            ),
                          )
                        : AppResponsive(
                            mobile: mobile,
                          ),
                  )
                : hasScrollable!
                    ? SingleChildScrollView(
                        child: AppResponsive(
                          mobile: mobile,
                        ),
                      )
                    : AppResponsive(
                        mobile: mobile,
                      ),
            if (isLoading!) customLoader ?? const FullScreenLoader(),
          ],
        ),
      ),
    );
  }
}
