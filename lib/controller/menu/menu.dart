import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/base/base_controller.dart';
import 'package:restaurant_app/model/order/order.dart';

import '../../model/food/food.dart';

class AppMenuController extends BaseController {
  List<Food> menu = [];
  List<AppOrder> orderList = [];

  Future<void> getMenu() async {
    menu.clear();
    updateListeners(isLoading: true);
    FirebaseFirestore.instance.collection('food').get().then((snapshot) async {
      print('snapshot = ${snapshot.docs.first.data()}');
      for (QueryDocumentSnapshot snapshot in snapshot.docs) {
        Food food = Food.fromJson(snapshot.data() as Map<String, dynamic>);
        menu.add(food);
      }
      for (Food food in menu) {
        print(food.name);
      }
      updateListeners();
    });
  }

  Future<void> getOrders() async {
    orderList.clear();
    updateListeners(isLoading: true);
    FirebaseFirestore.instance.collection('order').get().then((snapshot) async {
      print('snapshot order = ${snapshot.docs.first.data()}');
      for (QueryDocumentSnapshot snapshot in snapshot.docs) {
        AppOrder order = AppOrder.fromJson(snapshot.data() as Map<String, dynamic>);
        orderList.add(order);
      }
      for (AppOrder order in orderList) {
        print(order.id);
      }
      updateListeners();
    });
  }

  Future<void> order({required int id}) async {
    updateListeners(isLoading: true);
    Food orderFood = menu.firstWhere((food) => food.id == id);

    CollectionReference orderSnapshotListRef = FirebaseFirestore.instance.collection('order');
    // Call the user's CollectionReference to add a new user
    orderSnapshotListRef.count().get().then(
          (res) {
        return orderSnapshotListRef
            .doc('${res.count! + 1}')
            .set(orderFood.toJson())
            .then((value) => print("Food Added to Orders"))
            .catchError((error) => print("Failed to add food to orders: $error"));
      },
      onError: (e) => print("Error completing: $e"),
    );
    updateListeners();
  }

  @override
  void onInit() {
    builderId = 'menuController';
    super.onInit();
  }
}