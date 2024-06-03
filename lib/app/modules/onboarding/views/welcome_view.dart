import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class WelcomeView extends GetView<OnboardingController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Gap(14),
                Image.asset(
                  'assets/images/welcome.png',
                ),
                const Gap(20),
                Text(
                  "Temukan Ketenangan",
                  style: semiBold.copyWith(fontSize: 24, color: Neutral.dark1),
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Raih Kedamaian Batin dan Keseimbangan dengan Sesi Meditasi Terpandu",
                    style: regular.copyWith(fontSize: 14, color: Neutral.dark3),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(40),
                MainButton(
                    label: 'Masuk',
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    }),
                const Gap(16),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.REGISTER);
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Primary.mainColor,
                      ),
                      color: Neutral.light4,
                    ),
                    child: Text(
                      'Daftar',
                      style: semiBold.copyWith(
                          fontSize: 16, color: Primary.mainColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
