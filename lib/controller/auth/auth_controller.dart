import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/controller/base/base_controller.dart';

class AuthController extends BaseController {
  //Create Account
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController logInEmailTextController = TextEditingController();
  TextEditingController logInPasswordTextController = TextEditingController();

  //Log In
  TextEditingController signUpEmailTextController = TextEditingController();
  TextEditingController signUpPasswordTextController = TextEditingController();

  bool isObscure = true;

  //Log In FormKey
  final logInFormKey = GlobalKey<FormState>();
  final createAccountKey = GlobalKey<FormState>();

  void createAccount() {
    createAccountKey.currentState?.save();
    if ((createAccountKey.currentState?.validate() ?? false) &&
        isInActiveButtonCreateAcc() == false) {
      print('KAYIT GERÇEKLEŞTİ');
    } else {
      print('KAYIT PROBLEM!!!');
    }
  }

  bool isInActiveButtonCreateAcc() {
    bool value = !(fullNameTextController.text.isNotEmpty &&
        logInEmailTextController.text.isNotEmpty &&
        logInPasswordTextController.text.isNotEmpty);

    updateListeners();
    return value;
  }

  bool isInActiveButton() {
    bool value = !(signUpEmailTextController.text.isNotEmpty &&
        signUpPasswordTextController.text.isNotEmpty);

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
