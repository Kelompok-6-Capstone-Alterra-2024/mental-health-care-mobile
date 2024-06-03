import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../model/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == items.length - 1;

  forwardAction() {
    if (isLastPage) {
      Get.offNamed(Routes.WELCOME);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Bicara dengan Ahli",
        descriptions:
            "Dapatkan Dukungan dan Solusi Profesional untuk Kesehatan Mental Anda, Kapan Saja dan Di Mana Saja",
        image: "assets/images/onboarding1.png"),
    OnboardingInfo(
        title: "Bergabung dengan Komunitas",
        descriptions:
            "Berbagi Pengalaman, Temukan Dukungan, dan Belajar Bersama dalam Komunitas yang Peduli",
        image: "assets/images/onboarding2.png"),
    OnboardingInfo(
        title: "Temukan Ketenangan",
        descriptions:
            "Raih Kedamaian Batin dan Keseimbangan dengan Sesi Meditasi Terpandu",
        image: "assets/images/onboarding3.png"),
  ];
}
