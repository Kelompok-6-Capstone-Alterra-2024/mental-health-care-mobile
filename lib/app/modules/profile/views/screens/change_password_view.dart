import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/views/components/custom_form_password.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../constant/constant.dart';
import '../../../../../utils/global_components/main_button.dart';
import '../../controllers/profile_controller.dart';

class ChangePasswordView extends GetView<ProfileController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Ubah Kata Sandi',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Minimal 8 karakter, dengan huruf besar dan huruf kecil',
              style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
            ),
            const Gap(32),
            Obx(
              () => CustomFormPassword(
                title: 'Masukkan Kata Sandi Lama',
                obsecure: controller.isVisibleOldPassword.value,
                obsecureIcon: IconButton(
                  icon: SvgPicture.asset(
                    controller.isVisibleOldPassword.value
                        ? 'assets/icons/Eyehide.svg'
                        : 'assets/icons/eye-open.svg',
                  ),
                  onPressed: () {
                    controller.isVisibleOldPassword.value =
                        !controller.isVisibleOldPassword.value;
                  },
                ),
              ),
            ),
            Obx(
              () => CustomFormPassword(
                title: 'Masukkan Kata Sandi Baru',
                obsecure: controller.isVisible.value,
                obsecureIcon: IconButton(
                  icon: SvgPicture.asset(
                    controller.isVisible.value
                        ? 'assets/icons/Eyehide.svg'
                        : 'assets/icons/eye-open.svg',
                  ),
                  onPressed: () {
                    controller.isVisible.value = !controller.isVisible.value;
                  },
                ),
              ),
            ),
            Obx(
              () => CustomFormPassword(
                title: 'Konfirmasi Kata Sandi Baru',
                obsecure: controller.isVisible.value,
                obsecureIcon: IconButton(
                  icon: SvgPicture.asset(
                    controller.isVisible.value
                        ? 'assets/icons/Eyehide.svg'
                        : 'assets/icons/eye-open.svg',
                  ),
                  onPressed: () {
                    controller.isVisible.value = !controller.isVisible.value;
                  },
                ),
              ),
            ),
            Spacer(),
            MainButtonWithoutPadding(
              label: 'Simpan Password',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
