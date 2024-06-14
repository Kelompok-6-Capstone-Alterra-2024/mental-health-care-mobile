import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../mixin/article_mixin.dart';
import '../mixin/music_mixin.dart';
import '../mixin/story_mixin.dart';

class MeditationController extends GetxController
    with
        GetSingleTickerProviderStateMixin,
        ArticleMixin,
        StoryMixin,
        MusicMixin {
  late TabController tabController;
  var currentTab = 0.obs;
  List<String> tabs = ['Musik', 'Artikel', 'Cerita Inspiratif'];
  final String token = GetStorage().read('token');
  final logger = Logger();
  String get tabNameTitle {
    String title = tabs[currentTab.value];

    if (title == 'Musik' || title == 'Artikel') {
      return '$title Meditasi';
    } else {
      return title;
    }
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
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      currentTab.value = tabController.index;
    });
  }

  @override
  void onReady() {
    super.onReady();
    logger.i('Token: $token');
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
