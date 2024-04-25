import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppResponsive extends StatelessWidget {
  const AppResponsive({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.watch,
  });

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? watch;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      if (size.deviceScreenType == DeviceScreenType.mobile && mobile != null) {
        return mobile!;
      } else if (size.deviceScreenType == DeviceScreenType.tablet &&
          tablet != null) {
        return tablet!;
      } else if (size.deviceScreenType == DeviceScreenType.desktop &&
          desktop != null) {
        return desktop!;
      } else if (size.deviceScreenType == DeviceScreenType.watch &&
          watch != null) {
        return watch!;
      }
      return Container();
    });
  }
}
