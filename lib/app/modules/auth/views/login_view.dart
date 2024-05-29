import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/global_components/main_button.dart';
import '../../../../utils/global_components/text_input_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';
import 'components/auth_button.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Selamat Datang Kembali!',
                  style:
                      semiBold.copyWith(fontSize: 24, color: Primary.mainColor),
                ),
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Masuk untuk Melanjutkan Perjalanan Kesehatan Mental Anda',
                  style: regular.copyWith(fontSize: 16, color: Neutral.dark3),
                ),
              ),
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: InputField(
                title: 'Ketikkan Username',
                onChanged: controller.username.call,
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
              ),
            ),
            const Gap(10),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: InputField(
                  title: 'Ketikkan Password',
                  onChanged: controller.password.call,
                  obscureText: controller.obscureText.value,
                  validator: (pwd) => controller.validatePassword(pwd),
                  icon: GestureDetector(
                    onTap: () {
                      controller.obscureText.value =
                          !controller.obscureText.value;
                    },
                    child: SizedBox(
                      width: 10,
                      height: 20,
                      child: SvgPicture.asset(
                        controller.obscureText.value
                            ? 'assets/icons/eye-closed.svg'
                            : 'assets/icons/eye-open.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(16),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: GestureDetector(
                  onTap: () {
                    // Implement Forgot Password
                    Get.offNamed(Routes.FORGET_PASSWORD);
                  },
                  child: Text(
                    'Lupa Password?',
                    style: medium.copyWith(
                      fontSize: 14,
                      color: Neutral.dark2,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(60),
            MainButton(
              label: 'Masuk',
              onTap: () {
                // Implement Login
                log('login button tapped');
              },
            ),
            const Gap(32),
            Text(
              'Atau masuk dengan',
              style: medium.copyWith(fontSize: 16, color: Neutral.dark3),
            ),
            const Gap(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthButton(
                  svgAssetPath: 'assets/icons/google.svg',
                  label: 'Google',
                  onTap: () {
                    // Implement Google Sign In
                    log('Google Sign In button tapped');
                  },
                ),
                const Gap(20),
                AuthButton(
                  svgAssetPath: 'assets/icons/facebook.svg',
                  label: 'Facebook',
                  onTap: () {
                    // Implement Facebook Sign In
                    log('Facebook Sign In button tapped');
                  },
                ),
              ],
            ),
            const Gap(170),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun? ',
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.REGISTER);
                  },
                  child: Text(
                    'Daftar',
                    style:
                        bold.copyWith(fontSize: 16, color: Primary.mainColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
