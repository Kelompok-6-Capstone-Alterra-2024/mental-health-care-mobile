import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/global_components/custom_form.dart';
import '../../../../utils/global_components/main_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

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
              child: CustomForm(
                title: 'Ketikkan Username',
                onChanged: controller.setUsername,
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
                child: CustomForm(
                  title: 'Ketikkan Password',
                  onChanged: controller.setPassword,
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
                Get.offNamed(Routes.LOGIN);
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
                GestureDetector(
                  onTap: () {
                    // Implement Google Sign In
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Neutral.dark3,
                      ),
                      color: Neutral.light4,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            'assets/icons/google.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Text(
                          'Google',
                          style: semiBold.copyWith(
                              fontSize: 16, color: Neutral.dark3),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    // Implement Google Sign In
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Neutral.dark3,
                      ),
                      color: Neutral.light4,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            'assets/icons/facebook.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Text(
                          'Facebook',
                          style: semiBold.copyWith(
                              fontSize: 16, color: Neutral.dark3),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
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
