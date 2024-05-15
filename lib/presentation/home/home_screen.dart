import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/auth/auth_controller.dart';
import 'package:restaurant_app/presentation/base/base_screen.dart';

var ac = Get.find<AuthController>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        mobile: Column(
      children: [],
    ));
  }
}
