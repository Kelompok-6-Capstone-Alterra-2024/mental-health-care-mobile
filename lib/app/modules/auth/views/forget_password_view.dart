import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/global_components/main_button.dart';
import '../../../../utils/global_components/text_input_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class ForgetPasswordView extends GetView<AuthController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
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
                    'Lupa Password?',
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
                    'Tidak Perlu Khawatir, Kami Akan Membantu Anda Mengatur Ulang Kata Sandi Anda',
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
                  validator: (email) => controller.validateEmail(email),
                  onChanged: controller.setEmail,
                ),
              ),
              const Gap(32),
              MainButton(
                label: 'Kirim Code',
                onTap: () {
                  // Logic Here
                  if (controller.formKey.currentState!.validate()) {
                    Get.toNamed(Routes.VERIFICATION_CODE);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
