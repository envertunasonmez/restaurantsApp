import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/controller/base/base_controller.dart';

class AuthController extends BaseController {
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  void createAccount() {}

  @override
  void onInit() {
    builderId = 'authController';
    super.onInit();
  }
}
