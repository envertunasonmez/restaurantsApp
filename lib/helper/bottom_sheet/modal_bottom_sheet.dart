import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/auth/auth_controller.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/constant/static_asset.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
import 'package:restaurant_app/presentation/auth/forget_password/forget_password.dart';
import 'package:restaurant_app/route/routes.dart';
import 'package:restaurant_app/widget_modal/button/button.dart';
import '../../core/constant/radius.dart';
import '../../widget_modal/bottom_sheet/category/category.dart';
import '../../widget_modal/bottom_sheet/handler/handler.dart';
import '../../widget_modal/input_field/input_field.dart';

class AppBottomSheet {
  static void showCreateAccountBottomSheet() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 76.h,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              AppRadius.bottomSheetRadius,
            ),
            topRight: Radius.circular(
              AppRadius.bottomSheetRadius,
            ),
          ),
        ),
        child: GetBuilder<AuthController>(
            id: 'authController',
            builder: (ac) {
              return Center(
                child: SizedBox(
                  width: 80.w,
                  child: Column(
                    children: [
                      2.yh,
                      const BottomSheetHandler(),
                      4.yh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BottomSheetCategory(
                            text: 'Create Account',
                            onTap: () {},
                            isActive: true,
                          ),
                          BottomSheetCategory(
                            text: 'Log In',
                            onTap: () {
                              Future.delayed(
                                100.milliseconds,
                                () {
                                  Get.back();
                                  Future.delayed(500.milliseconds, () {
                                    AppBottomSheet.showLogInBottomSheet();
                                  });
                                },
                              );
                            },
                            isActive: false,
                          )
                        ],
                      ),
                      4.yh,
                      Form(
                          child: Column(
                        children: [
                          AppInputField(
                            controller: ac.fullNameTextController,
                            title: 'Full Name',
                            hint: 'Enter your full name',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          2.yh,
                          AppInputField(
                            controller: ac.logInEmailTextController,
                            title: 'Email address',
                            hint: 'example@gmail.com',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          2.yh,
                          AppInputField(
                            controller: ac.logInPasswordTextController,
                            title: 'Password',
                            hint: '***** ****** *****',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          4.yh,
                          Padding(
                            padding: 8.w.pH,
                            child: AppButton(
                              text: 'Registration',
                              onTap: () {},
                              isInActive: true,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  static void showLogInBottomSheet() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 76.h,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              AppRadius.bottomSheetRadius,
            ),
            topRight: Radius.circular(
              AppRadius.bottomSheetRadius,
            ),
          ),
        ),
        child: GetBuilder<AuthController>(
            id: 'authController',
            builder: (ac) {
              return Center(
                child: SizedBox(
                  width: 80.w,
                  child: Column(
                    children: [
                      2.yh,
                      const BottomSheetHandler(),
                      4.yh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BottomSheetCategory(
                            text: 'Create Account',
                            onTap: () {
                              Future.delayed(
                                100.milliseconds,
                                () {
                                  Get.back();
                                  Future.delayed(500.milliseconds, () {
                                    AppBottomSheet
                                        .showCreateAccountBottomSheet();
                                  });
                                },
                              );
                            },
                            isActive: false,
                          ),
                          BottomSheetCategory(
                            text: 'Log In',
                            onTap: () {},
                            isActive: true,
                          )
                        ],
                      ),
                      4.yh,
                      Form(
                          key: ac.logInFormKey,
                          child: Column(
                            children: [
                              AppInputField(
                                controller: ac.logInEmailTextController,
                                title: 'Email address',
                                hint: 'example@gmail.com',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.email(),
                                ]),
                                onChanged: (email) {
                                  ac.isInActiveButton();
                                },
                              ),
                              2.yh,
                              AppInputField(
                                controller: ac.logInPasswordTextController,
                                title: 'Password',
                                hint: '***** ****** *****',
                                isObscure: ac.isObscure,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(6),
                                ]),
                                suffix: GestureDetector(
                                  onTap: () => ac.toggleObscure(),
                                  child: Padding(
                                    padding: 1.h.pAll,
                                    child: SvgPicture.asset(
                                      ac.isObscure
                                          ? StaticAssets.eye
                                          : StaticAssets.secureEye,
                                      colorFilter: ColorFilter.mode(
                                        Get.theme.colorScheme.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                                onChanged: (password) {
                                  ac.isInActiveButton();
                                },
                              ),
                              2.yh,
                              GestureDetector(
                                onTap: () => Get.toNamed(
                                  AppPages.forgetPassword,
                                ),
                                child: Padding(
                                  padding: 160.pLeft,
                                  child: Text(
                                    'Forgot Password?',
                                    style: Get.theme.textTheme.labelMedium!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstants.primary,
                                    ),
                                  ),
                                ),
                              ),
                              4.yh,
                              Padding(
                                padding: 8.w.pH,
                                child: AppButton(
                                  text: 'Login',
                                  onTap: () => ac.logIn(),
                                  isInActive: ac.isInActiveButton(),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
