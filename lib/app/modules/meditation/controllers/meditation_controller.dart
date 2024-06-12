import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeditationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var currentTab = 0.obs;
  List<String> tabs = ['Musik', 'Artikel', 'Cerita Inspiratif'];

  String get tabNameTitle {
    String title = tabs[currentTab.value];

    if (title == 'Musik' || title == 'Artikel') {
      return '$title Meditasi';
    } else {
      return title;
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      currentTab.value = tabController.index;
    });
  }

  String getTabIcon(int index) {
    String title = tabs[index];
    if (title == 'Musik') {
      return 'assets/icons/Headset.svg';
    } else if (title == 'Artikel') {
      return 'assets/icons/Edit Content.svg';
    } else {
      return 'assets/icons/File.svg';
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
