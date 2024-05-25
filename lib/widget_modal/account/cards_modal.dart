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

class ProfileBar extends StatelessWidget {
  const ProfileBar({
    super.key,
    this.url,
    this.name,
    this.email,
  });

  final String? url;
  final String? name;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      decoration: BoxDecoration(
        color: ColorConstants.primary,
        borderRadius: BorderRadius.circular(
          AppRadius.buttonRadius,
        ),
      ),
      child: Row(
        children: [
          8.xw,
          Container(
            height: 6.h,
            width: 6.h,
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(10000),
            ),
            child: url == null
                ? Image.asset(StaticAssets.dummyAvatar)
                : Image.network(url!),
          ),
          8.xw,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? 'User',
                style: Get.theme.textTheme.labelMedium!.copyWith(
                  color: Get.theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email ?? 'email',
                style: Get.theme.textTheme.labelSmall!.copyWith(
                  color: Get.theme.colorScheme.secondary.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              print('bildirim tıklandı');
            },
            child: SvgPicture.asset(
              StaticAssets.notification,
              height: 3.h,
              colorFilter: ColorFilter.mode(
                Get.theme.colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          8.xw,
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
      decoration: BoxDecoration(
        color: ColorConstants.primary,
        borderRadius: BorderRadius.circular(
          AppRadius.buttonRadius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.language,
            rowText: 'Language',
            rowArrow: StaticAssets.secondArrowRight,
            onTap: () {},
          ),
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.feedback,
            rowText: 'Feedback',
            rowArrow: StaticAssets.secondArrowRight,
            onTap: () {},
          ),
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.rateUs,
            rowText: 'Rate Us',
            rowArrow: StaticAssets.secondArrowRight,
            onTap: () {},
          ),
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.newVersion,
            rowText: 'New Version',
            rowArrow: StaticAssets.secondArrowRight,
            onTap: () {},
          ),
          2.yh,
          RowOnTap(
            rowIcon: StaticAssets.newVersion,
            rowText: 'Settings',
            rowArrow: StaticAssets.secondArrowRight,
            onTap: () {},
          ),
          2.yh,
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
    required this.onTap,
  });

  final void Function() onTap;
  final String rowIcon;
  final String rowText;
  final String rowArrow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: 4.w.pH,
        height: 4.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(
            AppRadius.buttonRadius / 2,
          ),
        ),
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
      children: [
        4.xw,
        SvgPicture.asset(
          rowIcon,
          height: 2.h,
        ),
        8.xw,
        Text(
          rowText,
          style: Get.theme.textTheme.labelMedium!.copyWith(
            color: ColorConstants.black,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          rowArrow,
        ),
        8.xw,
      ],
    );
  }
}
