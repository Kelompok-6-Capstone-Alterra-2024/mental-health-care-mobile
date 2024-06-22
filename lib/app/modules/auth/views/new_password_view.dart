import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/global_components/main_button.dart';
import '../../../../utils/global_components/text_input_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class NewPasswordView extends GetView<AuthController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const Gap(100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Buat Password Baru',
                    style: semiBold.copyWith(
                        fontSize: 24, color: Primary.mainColor),
                  ),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Amankan akun dengan password baru',
                    style: regular.copyWith(fontSize: 16, color: Neutral.dark3),
                  ),
                ),
              ),
              const Gap(24),
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
                    onChanged: controller.setPasswordR,
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
                    onChanged: controller.setConfirmPasswordR,
                    obscureText: controller.obscureText.value,
                    validator: (pwd) => controller.validateConfirmPassword(pwd),
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
                  label: 'Simpan Password',
                  onTap: () {
                    // Logic Here
                  }),
              const Gap(16),
              GestureDetector(
                onTap: () {
                  Get.offNamed(Routes.LOGIN);
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
                    'Kembali Login',
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
    );
  }
}
