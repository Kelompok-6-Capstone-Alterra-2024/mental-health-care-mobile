import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'components/custom_settings_card.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const Gap(16),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/dummy-profile.jpg'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      profileController.profile.value.data.name,
                      style: semiBold.copyWith(fontSize: 24),
                    ),
                    Text(
                      profileController.profile.value.data.email,
                      style:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                    ),
                    const Gap(16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Primary.mainColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.EDIT_PROFILE);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/Edit2.svg', width: 24),
                          const Gap(10),
                          Text('Edit Profil',
                              style: semiBold.copyWith(
                                  fontSize: 16, color: Neutral.light1)),
                        ],
                      ),
                    ),
                    const Gap(32),
                    const Divider(
                      thickness: 1,
                      color: Neutral.dark4,
                    ),
                  ],
                ),
              ),
              CustomSettingCard(
                icon: 'assets/icons/UserCircle.svg',
                title: 'Pengaturan dan Privasi',
                onTap: () {
                  Get.toNamed(Routes.SETTING);
                },
              ),
              CustomSettingCard(
                icon: 'assets/icons/PaymentCard.svg',
                title: 'Transaksi',
                onTap: () {
                  Get.toNamed(Routes.TRANSACTION);
                },
              ),
              CustomSettingCard(
                icon: 'assets/icons/DollarCoin.svg',
                title: 'Poin',
                onTap: () {
                  Get.toNamed(Routes.POIN);
                },
              ),
              CustomSettingCard(
                icon: 'assets/icons/Email.svg',
                title: 'Ubah Email',
                onTap: () {
                  Get.toNamed(Routes.CHANGE_EMAIL);
                },
              ),
              const Divider(
                thickness: 1,
                color: Neutral.dark4,
              ),
              CustomSettingCard(
                icon: 'assets/icons/Help.svg',
                title: 'Pusat Bantuan',
                onTap: () {
                  Get.toNamed(Routes.CUSTOMER_SERVICES);
                },
              ),
              CustomSettingCard(
                icon: 'assets/icons/logout.svg',
                title: 'Logout',
                onTap: () {
                  GetStorage().erase();
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
              const Divider(
                thickness: 1,
                color: Neutral.dark4,
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
