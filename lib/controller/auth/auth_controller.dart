import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> createAccount() async {
    createAccountKey.currentState?.save();
    if ((createAccountKey.currentState?.validate() ?? false) &&
        isInActiveButtonCreateAcc() == false) {
      print('Input Password = ${signUpPasswordTextController.text}');
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: signUpEmailTextController.text,
            password: signUpPasswordTextController.text,
        );
      } on FirebaseAuthException catch (e) {
        print('Firebase errir $e');
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('KAYIT PROBLEM!!!');
    }
  }

  bool isInActiveButtonCreateAcc() {
    bool value = !(fullNameTextController.text.isNotEmpty &&
        signUpEmailTextController.text.isNotEmpty &&
        signUpPasswordTextController.text.isNotEmpty);

    updateListeners();
    return value;
  }

  bool isInActiveButton() {
    bool value = !(logInEmailTextController.text.isNotEmpty &&
        logInPasswordTextController.text.isNotEmpty);

    updateListeners();
    return value;
  }

  Future<void> logIn() async {
    logInFormKey.currentState?.save();
    if ((logInFormKey.currentState?.validate() ?? false) &&
        isInActiveButton() == false) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: logInEmailTextController.text,
            password: logInPasswordTextController.text,
        ).then((u) {
          print('Giris basarili. UID = ${u.user?.uid}');
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
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
