import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/radius.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/account/account_screen.dart';
import 'package:restaurant_app/presentation/booking_history/booking_history.dart';
import 'package:restaurant_app/presentation/home/home_screen.dart';

import '../../controller/bottomNavBar/bottom_nav_bar.dart';
import '../../core/constant/static_asset.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      id: 'bottomNavBarController',
      builder: (ctrl) => Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: 5.h.pBottom.add(
                8.w.pH,
              ),
          height: 5.h,
          width: 90.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Get.theme.colorScheme.primary.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(
              AppRadius.cardRadius * 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BottomNavBarItem(
                itemIndex: 0,
                selectedIndex: ctrl.selectedIndex,
                activeIcon: StaticAssets.selectedBookingHistory,
                inActiveIcon: StaticAssets.bookingHistory,
                onTap: () => ctrl.routeTo(0),
              ),
              _BottomNavBarItem(
                itemIndex: 1,
                selectedIndex: ctrl.selectedIndex,
                activeIcon: StaticAssets.selectedHome,
                inActiveIcon: StaticAssets.home,
                onTap: () => ctrl.routeTo(1),
              ),
              _BottomNavBarItem(
                itemIndex: 2,
                selectedIndex: ctrl.selectedIndex,
                activeIcon: StaticAssets.selectedProfile,
                inActiveIcon: StaticAssets.profile,
                onTap: () => ctrl.routeTo(2),
              ),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: ctrl.mainPageController,
          children: const [
            BookingHistoryScreen(),
            HomeScreen(),
            AccountScreen(),
          ],
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    super.key,
    required this.onTap,
    required this.itemIndex,
    required this.selectedIndex,
    required this.activeIcon,
    required this.inActiveIcon,
  });

  final void Function() onTap;
  final int itemIndex;
  final int selectedIndex;
  final String activeIcon;
  final String inActiveIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        selectedIndex == itemIndex ? activeIcon : inActiveIcon,
      ),
    );
  }
}
