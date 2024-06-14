import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/views/components/custom_form_profile.dart';
import 'package:mindease/app/modules/profile/views/components/custom_settings_card.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/profile_controller.dart';

class SettingView extends GetView<ProfileController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Pengaturan dan Privasi',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(24),
            const CustomSettingCard(
                icon: 'assets/icons/Settings2.svg', title: 'Bahasa'),
            const Divider(
              color: Neutral.dark4,
              thickness: 1,
            ),
            CustomSettingCard(
              icon: 'assets/icons/Settings2.svg',
              title: 'Ubah Kata Sandi',
              onTap: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
            ),
            const Gap(24),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Error.mainColor,
                ),
                child: Text(
                  'Hapus Akun',
                  style: semiBold.copyWith(fontSize: 16, color: Neutral.light4),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
