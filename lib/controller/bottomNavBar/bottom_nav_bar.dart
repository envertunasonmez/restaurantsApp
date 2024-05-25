import 'package:flutter/cupertino.dart';

import '../base/base_controller.dart';

class BottomNavBarController extends BaseController{

  PageController mainPageController = PageController(initialPage: 1);
  int initialIndex = 1;
  int selectedIndex = 1;

  void routeTo(int index) {
    mainPageController.jumpToPage(index);
    selectedIndex = index;
    updateListeners();
  }

  @override
  void onInit() {
    builderId = 'bottomNavBarController';
    super.onInit();
  }

}