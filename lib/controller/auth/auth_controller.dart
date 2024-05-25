import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/cache/cache.dart';
import 'package:restaurant_app/controller/base/base_controller.dart';
import 'package:restaurant_app/model/offer/offer.dart';
import 'package:restaurant_app/model/restaurant/restaurant.dart';
import 'package:restaurant_app/model/user.dart';
import 'package:restaurant_app/route/routes.dart';

import '../../helper/snack_bar/snack_bar.dart';

class AuthController extends BaseController {
  AppUser appUser = AppUser(id: '-1');
  List<Offer> offerList = [];
  List<Restaurant> restaurantList = [];
  List<Restaurant> bookedRestaurantList = [];

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
            .then((userCredential) async {
          AppSnackBar.show(
            statusCode: 200,
            successMessage: 'Your account has been created!',
            errorMessage: 'error',
          );
          await _addUser(
            username: fullNameTextController.text,
            email: signUpEmailTextController.text,
            password: signUpPasswordTextController.text,
          );
          AppCache.addValue(
            key: 'userEmail',
            value: signUpEmailTextController.text,
          );
          Get.offAndToNamed(AppPages.main);
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
    print((logInFormKey.currentState?.validate() ?? false) &&
        isInActiveButton() == false);
    if ((logInFormKey.currentState?.validate() ?? false) &&
        isInActiveButton() == false) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: logInEmailTextController.text,
          password: logInPasswordTextController.text,
        )
            .onError((error, stackTrace) {
          print(stackTrace);
          print(error);
          throw error!;
        }).then((u) {
          AppCache.addValue(
            key: 'userEmail',
            value: logInEmailTextController.text,
          );
          Get.offAndToNamed(AppPages.main);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AppSnackBar.show(
            statusCode: 404,
            successMessage: '',
            errorMessage: e.message,
          );
        } else if (e.code == 'wrong-password') {
          AppSnackBar.show(
            statusCode: 404,
            successMessage: '',
            errorMessage: e.message,
          );
        }
      }
    } else {
      print('LOG IN PROBLEM!!!');
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAndToNamed(
        AppPages.authMain,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
              'id': res.count! + 1,
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

  Future<void> getUser({required String email}) async {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((snapshot) {
      appUser = AppUser(
        id: snapshot.docs.first.data()['id'].toString(),
        username: snapshot.docs.first.data()['username'],
        email: snapshot.docs.first.data()['email'],
        password: snapshot.docs.first.data()['password'],
      );
    });
  }

  Future<void> getOffers() async {
    offerList.clear();
    updateListeners(isLoading: true);
    FirebaseFirestore.instance.collection('offer').get().then((snapshot) async {
      print('snapshot = ${snapshot.docs.first.data()}');
      for (QueryDocumentSnapshot snapshot in snapshot.docs) {
        Offer offer = Offer.fromJson(snapshot.data() as Map<String, dynamic>);
        String imagePath =
            await _getOfferImageUrl(imageUrl: offer.imageName ?? '');
        offer.imageNetworkPath = imagePath;
        String logoPath = await _getOfferLogoUrl(logoUrl: offer.logoName ?? '');
        offer.logoNetworkPath = logoPath;
        offerList.add(offer);
      }
      for (Offer offer in offerList) {
        print(offer.title);
      }
      updateListeners();
    });
  }

  Future<void> getRestaurants() async {
    restaurantList.clear();
    updateListeners(isLoading: true);
    FirebaseFirestore.instance
        .collection('restaurant')
        .get()
        .then((snapshot) async {
      print('snapshot rest = ${snapshot.docs.first.data()}');
      for (QueryDocumentSnapshot snapshot in snapshot.docs) {
        Restaurant restaurant =
            Restaurant.fromJson(snapshot.data() as Map<String, dynamic>);
        String imagePath =
            await _getRestaurantImageUrl(imageUrl: restaurant.image ?? '');
        restaurant.imageNetworkPath = imagePath;
        restaurantList.add(restaurant);
      }
      updateListeners();
    });
  }

  Future<void> getBookedRestaurants() async {
    bookedRestaurantList.clear();
    updateListeners(isLoading: true);
    FirebaseFirestore.instance
        .collection('restaurant')
        .where('booked', isEqualTo: true)
        .get()
        .then((snapshot) async {
      for (QueryDocumentSnapshot snapshot in snapshot.docs) {
        Restaurant restaurant =
            Restaurant.fromJson(snapshot.data() as Map<String, dynamic>);
        String imagePath =
            await _getRestaurantImageUrl(imageUrl: restaurant.image ?? '');
        restaurant.imageNetworkPath = imagePath;
        bookedRestaurantList.add(restaurant);
      }
      updateListeners();
    });
  }

  Future<void> addRestaurantToBookHistory({required String id}) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(id)
        .update({"booked": true});
  }

  ///Get storage images functions

  Future<String> _getOfferImageUrl({required String imageUrl}) async {
    final gsReference = FirebaseStorage.instance
        .refFromURL("gs://restaurant-app-86fbc.appspot.com/offer_image/image");
    String url = await gsReference.child("/$imageUrl").getDownloadURL();
    print('Offer image url => $url');
    return url;
  }

  Future<String> _getOfferLogoUrl({required String logoUrl}) async {
    final gsReference = FirebaseStorage.instance
        .refFromURL("gs://restaurant-app-86fbc.appspot.com/offer_image/logo");
    String url = await gsReference.child("/$logoUrl").getDownloadURL();
    print('Logo image url => $url');
    return url;
  }

  Future<String> _getRecommendedImageUrl({required String imageUrl}) async {
    final gsReference = FirebaseStorage.instance.refFromURL(
        "gs://restaurant-app-86fbc.appspot.com/recommended_food_image");
    String url = await gsReference.child("/$imageUrl").getDownloadURL();
    print('Recommended image url => $url');
    return url;
  }

  Future<String> _getRestaurantImageUrl({required String imageUrl}) async {
    final gsReference = FirebaseStorage.instance
        .refFromURL("gs://restaurant-app-86fbc.appspot.com/restaurant_image");
    String url = await gsReference.child("/$imageUrl").getDownloadURL();
    print('Restaurant image url => $url');
    return url;
  }

  ///
  ///

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
