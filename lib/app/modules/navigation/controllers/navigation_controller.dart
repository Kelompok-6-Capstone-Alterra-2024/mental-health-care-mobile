import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class NavigationController extends GetxController {
  //TODO: Implement NavigationController
  RxInt selectedIndex = 0.obs;

  final screen = [
    const HomeView(),
    const HomeView(),
    const SizedBox(),
    const HomeView(),
    const HomeView(),
  ];

  final currentScreen = HomeView();

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  @override
  void onInit() {
    super.onInit();
  }


}
