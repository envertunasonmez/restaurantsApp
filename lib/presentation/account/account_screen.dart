import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';
import 'package:restaurant_app/widget_modal/account/account_cards/cards_modal.dart';
import 'package:restaurant_app/widget_modal/button/button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        backgroundColor: ColorConstants.background.withOpacity(
          0.95,
        ),
        mobile: Column(
          children: [
            4.yh,
            profileBar(),
            6.yh,
            accountSettings(),
            2.yh,
            appInformation(),
            4.yh,
            SizedBox(
              height: 4.h,
              width: 16.h,
              child: AppButton(
                backgroundColor: ColorConstants.error,
                text: 'Logout',
                onTap: () {
                  print('çıkış yapıldı');
                },
              ),
            ),
          ],
        ));
  }
}
