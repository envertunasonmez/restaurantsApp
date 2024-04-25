import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  }) : super(key: key);

  final bool? hasScrollable;
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
