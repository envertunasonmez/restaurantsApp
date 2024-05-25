import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/auth/auth_controller.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';
import 'package:restaurant_app/widget_modal/account/cards_modal.dart';
import 'package:restaurant_app/widget_modal/button/button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        id: 'authController',
        builder: (ac) {
          return BaseScreen(
              backgroundColor: ColorConstants.background.withOpacity(
                0.95,
              ),
              mobile: Column(
                children: [
                  4.yh,
                  ProfileBar(
                    //url: ac.appUser.email,
                    name: ac.appUser.username,
                    email: ac.appUser.email,
                  ),
                  2.yh,
                  const AppInformation(),
                  4.yh,
                  SizedBox(
                    height: 4.h,
                    width: 16.h,
                    child: AppButton(
                      backgroundColor: ColorConstants.error,
                      text: 'Logout',
                      onTap: () => ac.logOut(),
                    ),
                  ),
                ],
              ));
        });
  }
}
