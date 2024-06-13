import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/meditation/views/meditation_view.dart';
import 'package:mindease/app/modules/profile/views/profile_view.dart';

import '../../forum/views/forum_view.dart';
import '../../home/views/home_view.dart';

class NavigationController extends GetxController {
  //TODO: Implement NavigationController
  RxInt selectedIndex = 0.obs;

  final screen = [
    const HomeView(),
    const ForumView(),
    const SizedBox(),
    const MeditationView(),
    const ProfileView(),
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
