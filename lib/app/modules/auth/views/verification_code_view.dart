import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/global_components/main_button.dart';
import '../controllers/auth_controller.dart';

class VerificationCodeView extends GetView<AuthController> {
  const VerificationCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Verifikasi Kode Anda',
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
                'Masukkan Kode Verifikasi yang Kami Kirim ke Email Anda',
                style: regular.copyWith(fontSize: 16, color: Neutral.dark3),
              ),
            ),
          ),
          const Gap(24),
          OtpTextField(
            fieldWidth: 64,
            fieldHeight: 64,
            numberOfFields: 5,
            borderColor: Neutral.dark4,
            showFieldAsBox: true,
            focusedBorderColor: Primary.mainColor,
            cursorColor: Primary.mainColor,
            textStyle: regular.copyWith(fontSize: 16, color: Neutral.dark1),
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            onSubmit: (String verificationCode) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                },
              );
            },
          ),
          const Gap(32),
          MainButton(
            label: 'Kirim Code',
            onTap: () {
              // Logic Here
              // Get.toNamed(Routes.NEW_PASSWORD);
              log('Verification Code View: Send Code Button Pressed');
            },
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum menerima kode? ',
                style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
              ),
              GestureDetector(
                onTap: () {
                  // Logic Here
                },
                child: Text(
                  'Kirim Ulang',
                  style: bold.copyWith(fontSize: 16, color: Primary.mainColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
