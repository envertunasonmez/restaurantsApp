import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/auth/auth_controller.dart';
import 'package:restaurant_app/core/constant/color.dart';
import 'package:restaurant_app/core/extension/num_x.dart';
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
                            onTap: () {},
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
                            controller: ac.emailTextController,
                            title: 'Email address',
                            hint: 'example@gmail.com',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          2.yh,
                          AppInputField(
                            controller: ac.passwordTextController,
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
                            onTap: () {},
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
                          child: Column(
                        children: [
                          AppInputField(
                            controller: ac.emailTextController,
                            title: 'Email address',
                            hint: 'example@gmail.com',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          2.yh,
                          AppInputField(
                            controller: ac.passwordTextController,
                            title: 'Password',
                            hint: '***** ****** *****',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          2.yh,
                          GestureDetector(
                            onTap: () {
                              print('tıklandı');
                            },
                            child: Padding(
                              padding: 160.pLeft,
                              child: Container(
                                child: Text(
                                  'Forgot Password?',
                                  style:
                                      Get.theme.textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          4.yh,
                          Padding(
                            padding: 8.w.pH,
                            child: AppButton(
                              text: 'Login',
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
}
