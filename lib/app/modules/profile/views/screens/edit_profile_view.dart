import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/views/components/custom_form_profile.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Edit Profil',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/dummy-profile.jpg'),
                ),
              ),
              const Gap(50),
              const CustomFormProfile(
                title: 'Username',
              ),
              const CustomFormProfile(
                title: 'Email',
              ),
              const CustomFormProfile(
                title: 'Nomor Telepon',
              ),
              const CustomFormProfile(
                title: 'Jenis Kelamin',
              ),
              const CustomFormProfile(
                title: 'Lokasi',
              ),
              const Gap(32),
              MainButtonWithoutPadding(label: 'Simpan', onTap: () {}),
              const Gap(24)
            ],
          ),
        ),
      ),
    );
  }
}
