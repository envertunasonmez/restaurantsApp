// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/radius.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      decoration: BoxDecoration(
        color: ColorConstants.secondary,
        borderRadius: BorderRadius.circular(
          AppRadius.buttonRadius,
        ),
      ),
      child: RowOnTap(
          rowIcon: StaticAssets.profile,
          rowText: 'Account Settings',
          rowArrow: StaticAssets.edit),
    );
  }
}

class ProfileBar extends StatelessWidget {
  const ProfileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      decoration: BoxDecoration(
        color: ColorConstants.secondary,
        borderRadius: BorderRadius.circular(
          AppRadius.buttonRadius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tuna Sönmez',
                style: Get.theme.textTheme.labelMedium!.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'tuna@test.com',
                style: Get.theme.textTheme.labelMedium!.copyWith(
                  color: ColorConstants.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              print('bildirim tıklandı');
            },
            child: SvgPicture.asset(
              StaticAssets.notification,
            ),
          ),
        ],
      ),
    );
  }
}

class AppInformation extends StatelessWidget {
  const AppInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
        color: ColorConstants.secondary,
        borderRadius: BorderRadius.circular(
          AppRadius.buttonRadius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RowOnTap(
            rowIcon: StaticAssets.language,
            rowText: 'Language',
            rowArrow: StaticAssets.secondArrowRight,
          ),
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.feedback,
            rowText: 'Feedback',
            rowArrow: StaticAssets.secondArrowRight,
          ),
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.rateUs,
            rowText: 'Rate Us',
            rowArrow: StaticAssets.secondArrowRight,
          ),
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.newVersion,
            rowText: 'New Version',
            rowArrow: StaticAssets.secondArrowRight,
          ),
        ],
      ),
    );
  }
}

class RowOnTap extends StatelessWidget {
  const RowOnTap({
    required this.rowIcon,
    required this.rowText,
    required this.rowArrow,
    super.key,
  });
  final String rowIcon;
  final String rowText;
  final String rowArrow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tıklama olayını burada ele alın
        print('Row1 tıklandı');
      },
      child: Container(
        alignment: Alignment.center,
        child: AccountScreenRow(
          rowIcon: rowIcon,
          rowText: rowText,
          rowArrow: rowArrow,
        ),
      ),
    );
  }
}

class AccountScreenRow extends StatelessWidget {
  const AccountScreenRow({
    Key? key,
    required this.rowIcon,
    required this.rowText,
    required this.rowArrow,
  }) : super(key: key);

  final String rowIcon;
  final String rowText;
  final String rowArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          rowIcon,
        ),
        Text(
          rowText,
          style: Get.theme.textTheme.labelMedium!.copyWith(
            color: ColorConstants.black,
          ),
        ),
        SvgPicture.asset(
          rowArrow,
        ),
      ],
    );
  }
}
