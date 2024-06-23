import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/views/components/custom_form_profile.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  EditProfileView({Key? key}) : super(key: key);

  String name = "";
  String bio = "";
  String profilePicture = "";
  int age = 0;

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
      body: Obx(
        () {
          controller.usernameController.text =
              controller.profile.value.data.username;
          controller.emailController.text = controller.profile.value.data.email;
          controller.phoneNumberController.text =
              controller.profile.value.data.phoneNumber;
          controller.genderController.text =
              controller.profile.value.data.gender;
          controller.addressController.text =
              controller.profile.value.data.address;
          name = controller.profile.value.data.name;
          bio = controller.profile.value.data.bio;
          profilePicture = controller.profile.value.data.profilePicture;
          age = controller.profile.value.data.age;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(16),
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/dummy-profile.jpg'),
                    ),
                  ),
                  const Gap(50),
                  CustomFormProfile(
                    title: 'Username',
                    controller: controller.usernameController,
                    hinttext: controller.profile.value.data.username,
                  ),
                  CustomFormProfile(
                    title: 'Email',
                    controller: controller.emailController,
                    hinttext: controller.profile.value.data.email,
                  ),
                  CustomFormProfile(
                    title: 'Nomor Telepon',
                    controller: controller.phoneNumberController,
                    hinttext: controller.profile.value.data.phoneNumber,
                  ),
                  CustomFormProfile(
                    title: 'Jenis Kelamin',
                    controller: controller.genderController,
                    hinttext: controller.profile.value.data.gender,
                  ),
                  CustomFormProfile(
                    title: 'Lokasi',
                    controller: controller.addressController,
                    hinttext: controller.profile.value.data.address,
                  ),
                  const Gap(32),
                  MainButtonWithoutPadding(
                    label: 'Simpan',
                    onTap: () {
                      controller.updateProfile();
                    },
                  ),
                  const Gap(24)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
