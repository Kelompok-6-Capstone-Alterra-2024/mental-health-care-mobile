import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/views/components/change_email_card.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/change_email_controller.dart';
import '../../controllers/profile_controller.dart';

class ChangeEmailView extends GetView<EmailOTPController> {
  ChangeEmailView({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController _email = TextEditingController();
  final EmailOTPController emailOTPController = Get.put(EmailOTPController());
  final ChangeEmailController changeEmailController =
      Get.put(ChangeEmailController());
  final RxString otpCode = ''.obs;
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
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(32),
                ChangeEmailCard(
                  emailAddress: profileController.profile.value.data.email,
                  onTap: () {
                    Get.dialog(
                      Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
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
                                    controller: _email,
                                    decoration: primary.copyWith(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 8),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 14,
                                        horizontal: 16,
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                  MainButtonWithoutPadding(
                                    label: 'Kirim Kode',
                                    onTap: () {
                                      emailOTPController.sendOtp(_email.text);
                                      Get.dialog(
                                        barrierDismissible: false,
                                        Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          backgroundColor: Neutral.light4,
                                          surfaceTintColor: Neutral.transparent,
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(19),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Kode sudah dikirim ke email anda',
                                                        style: medium.copyWith(
                                                            fontSize: 16),
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text(
                                                        _email.text,
                                                        style: medium.copyWith(
                                                            fontSize: 16),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Gap(16),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    OtpTextField(
                                                      numberOfFields: 5,
                                                      borderColor:
                                                          Neutral.dark5,
                                                      showFieldAsBox: true,
                                                      onCodeChanged:
                                                          (String code) {
                                                        // Handle validation or checks here if necessary
                                                      },
                                                      onSubmit: (String
                                                          verificationCode) {
                                                        otpCode.value =
                                                            verificationCode;
                                                      },
                                                    ),
                                                    const Gap(10),
                                                    Text(
                                                      'Tidak menerima email?',
                                                      style: regular.copyWith(
                                                        fontSize: 14,
                                                        color: Neutral.dark1,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        emailOTPController
                                                            .sendOtp(
                                                                _email.text);
                                                      },
                                                      child: Text(
                                                        'Kirim ulang',
                                                        style:
                                                            semiBold.copyWith(
                                                          fontSize: 14,
                                                          color:
                                                              Primary.mainColor,
                                                        ),
                                                      ),
                                                    ),
                                                    const Gap(20),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Primary
                                                                    .mainColor,
                                                          ),
                                                          child: Text(
                                                            'Batalkan',
                                                            style: semiBold
                                                                .copyWith(
                                                              fontSize: 16,
                                                              color: Neutral
                                                                  .light4,
                                                            ),
                                                          ),
                                                        ),
                                                        Gap(5),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            final email =
                                                                _email.text;
                                                            final code =
                                                                otpCode.value;
                                                            changeEmailController
                                                                .changeEmail(
                                                                    email,
                                                                    code);
                                                            Get.toNamed(Routes
                                                                .NAVIGATION);
                                                            profileController
                                                                .fetchProfile();
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor: Primary
                                                                .mainColor, // Set the background color to green
                                                          ),
                                                          child: Text(
                                                            'Konfirmasi',
                                                            style: semiBold
                                                                .copyWith(
                                                              fontSize: 16,
                                                              color: Neutral
                                                                  .light4,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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
          );
        },
      ),
    );
  }
}
