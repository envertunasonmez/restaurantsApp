import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/radius.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';

class accountSettings extends StatelessWidget {
  const accountSettings({
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
          const Icon(
            Icons.account_box,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account settings',
                style: Get.theme.textTheme.labelMedium!.copyWith(
                  color: ColorConstants.black,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: ColorConstants.black,
            ),
          ),
        ],
      ),
    );
  }
}

class profileBar extends StatelessWidget {
  const profileBar({
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_on,
              color: ColorConstants.black,
            ),
          ),
        ],
      ),
    );
  }
}

class appInformation extends StatelessWidget {
  const appInformation({
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.account_box,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Language',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: ColorConstants.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                StaticAssets.arrowRight,
              ),
            ],
          ),
          2.yh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.account_box,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Feedback',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: ColorConstants.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                StaticAssets.arrowRight,
              ),
            ],
          ),
          2.yh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.account_box,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rate us',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: ColorConstants.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                StaticAssets.arrowRight,
              ),
            ],
          ),
          2.yh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.account_box,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Version',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: ColorConstants.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                StaticAssets.arrowRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
