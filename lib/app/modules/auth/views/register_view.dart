import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import 'components/auth_button.dart';
import '../../../../utils/global_components/text_input_field.dart';
import '../../../../utils/global_components/main_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);
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
                  'Mulai Perjalanan Anda',
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
                  'Daftar untuk Memulai Perjalanan Menuju Kesehatan Mental yang Lebih Baik',
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
                  'Email',
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: InputField(
                title: 'Ketikkan Email',
                onChanged: controller.email.call,
              ),
            ),
            const Gap(16),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Konfirmasi Password',
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
              ),
            ),
            const Gap(10),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: InputField(
                  title: 'Ketikkan konfirmasi password',
                  onChanged: controller.confirmPassword.call,
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
            const Gap(32),
            MainButton(
              label: 'Daftar',
              onTap: () {
                // Logic Daftar
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
            const Gap(35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.LOGIN);
                  },
                  child: Text(
                    'Masuk',
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
