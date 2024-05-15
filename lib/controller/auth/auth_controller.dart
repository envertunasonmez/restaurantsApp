import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/controller/base/base_controller.dart';
import 'package:restaurant_app/model/user.dart';

class AuthController extends BaseController {
  AppUser appUser = AppUser(id: '-1');

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
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: signUpEmailTextController.text,
          password: signUpPasswordTextController.text,
        )
            .then((userCredential) {
          _addUser(
            username: fullNameTextController.text,
            email: signUpEmailTextController.text,
            password: signUpPasswordTextController.text,
          );
        });
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
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: logInEmailTextController.text,
          password: logInPasswordTextController.text,
        )
            .then((u) {
          _getUser(email: logInEmailTextController.text);
          //print('Giris basarili. UID = ${u.user?.uid}');
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

  Future<void> _addUser({
    String? username,
    String? email,
    String? password,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    users.count().get().then(
      (res) {
        return users
            .doc('${res.count! + 1}')
            .set({
              'username': username ?? '',
              'email': email ?? '',
              'password': password ?? ''
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  Future<void> _getUser({required String email}) async {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((snapshot) {
      appUser = AppUser(
        id: snapshot.docs.first.data()['id'],
        username: snapshot.docs.first.data()['username'],
        email: snapshot.docs.first.data()['email'],
        password: snapshot.docs.first.data()['password'],
      );
    });
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
