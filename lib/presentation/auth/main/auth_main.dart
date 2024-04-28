import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/helper/bottom_sheet/modal_bottom_sheet.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';

import '../../../widget_modal/button/button.dart';
import '../strings/strings.dart';

part 'widgets.dart';

///Use Case
///User will be authenticated in this screen
///There are two ways to registration: Email and Google Sing In
/// The registration bottom sheet will be opened when user clicks
/// to buttons.

class AuthMainScreen extends StatelessWidget {
  const AuthMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobile: Center(
        child: SizedBox(
          width: 72.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Static registration image
              Image.asset(
                StaticAssets.registerImage,
              ),
              8.yh,
              //Welcome text
              Text(
                AuthStrings.welcome,
                style: Get.theme.textTheme.bodyMedium!.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Welcome subtitle
              SizedBox(
                width: 72.w,
                child: Text(
                  AuthStrings.welcomeSubtitle,
                  style: Get.theme.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              12.yh,
              //Create account button
              AppButton(
                text: 'Create Account',
                onTap: () {},
              ),
              2.yh,
              //Log in button
              AppButton(
                text: 'Login',
                onTap: () => AppBottomSheet.showAuthBottomSheet(),
                backgroundColor: ColorConstants.lightPrimary,
                textColor: Get.theme.colorScheme.primary,
              ),
              2.yh,
              //Terms of conditions and privacy policy text
              TermsWidget(
                onTapTerms: () {},
                onTapPrivacy: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
