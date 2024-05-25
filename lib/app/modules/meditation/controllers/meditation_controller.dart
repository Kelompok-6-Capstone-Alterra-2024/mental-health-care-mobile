import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeditationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement MeditationController

  late TabController tabController;
  var currentTab = 0.obs;
  List<String> tabs = ['Musik', 'Artikel', 'Cerita Inspiratif'];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      currentTab.value = tabController.index;
    });
  }

  String get TabNameTitle {
    String title = tabs[currentTab.value];

    if (title == 'Musik' || title == 'Artikel') {
      return '$title Meditasi';
    } else {
      return title;
    }
  }
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
