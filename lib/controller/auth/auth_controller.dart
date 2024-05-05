import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/controller/base/base_controller.dart';

class AuthController extends BaseController {
  //Log In
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController logInEmailTextController = TextEditingController();
  TextEditingController logInPasswordTextController = TextEditingController();

  //Create Account
  TextEditingController signUpEmailTextController = TextEditingController();
  TextEditingController signUpPasswordTextController = TextEditingController();

  bool isObscure = true;

  //Log In FormKey
  final logInFormKey = GlobalKey<FormState>();

  void createAccount() {}

  bool isInActiveButton() {
    bool value = !(logInEmailTextController.text.isNotEmpty &&
        logInPasswordTextController.text.isNotEmpty);
    updateListeners();
    return value;
  }

  void logIn() {
    logInFormKey.currentState?.save();
    if ((logInFormKey.currentState?.validate() ?? false) &&
        isInActiveButton() == false) {
      print('GIRIS YAPABILIRSIN!!!');
    } else {
      print('LOG IN PROBLEM!!!');
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    updateListeners();
  }

  @override
  void onInit() {
    builderId = 'authController';
    super.onInit();
  }
}
