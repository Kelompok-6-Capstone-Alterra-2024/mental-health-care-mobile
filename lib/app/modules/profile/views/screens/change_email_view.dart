import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/views/components/change_email_card.dart';
import 'package:mindease/utils/global_components/main_button.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/profile_controller.dart';

class ChangeEmailView extends GetView<ProfileController> {
  const ChangeEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Ubah Email',
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
            const Gap(32),
            ChangeEmailCard(
              emailAddress: 'bayu123@gmail.com',
              onTap: () {
                Get.dialog(Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16), 
                  ),
                  backgroundColor: Neutral.light4,
                  surfaceTintColor: Neutral.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(19),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ubah Email',
                          style: medium.copyWith(fontSize: 16),
                        ),
                        const Gap(16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: primary.copyWith(
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, right: 8),
                                  child: SvgPicture.asset(
                                    'assets/icons/user-alt.svg',
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 16,
                                ),
                                hintText: 'Masukkan email anda',
                                hintStyle: regular.copyWith(
                                    color: Neutral.dark3, fontSize: 16),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 16,
                                ),
                              ),
                            ),
                            const Gap(20),
                            MainButtonWithoutPadding(
                              label: 'Kirim Kode',
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
              },
            ),
            const Gap(32),
            Text(
              'FAQ',
              style: semiBold.copyWith(fontSize: 16),
            ),
            const Gap(8),
            Divider(
              color: Neutral.dark1,
              thickness: 1,
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bagaimana cara mengubah email?',
                    style: regular.copyWith(fontSize: 16),
                  ),
                  SvgPicture.asset(
                    'assets/icons/ChevronRight.svg',
                  ),
                ],
              ),
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bagaimana email dapat terverifikasi?',
                    style: regular.copyWith(fontSize: 16),
                  ),
                  SvgPicture.asset(
                    'assets/icons/ChevronRight.svg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
