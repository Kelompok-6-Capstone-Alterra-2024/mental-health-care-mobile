import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../data/services/change_email_request_service.dart';
import '../data/services/send_otp_service.dart';

class EmailOTPController extends GetxController {
  final EmailOTPService _emailService = Get.put(EmailOTPService());

  RxBool isLoading = false.obs;

  void sendOtp(String email) async {
    try {
      isLoading.value = true;
      final response = await _emailService.sendOtp(email);
      if (response != null) {
        // Handle success
        print('Success: ${response['message']}');
      } else {
        // Handle failure
        print('Failed to send OTP');
      }
    } finally {
      isLoading.value = false;
    }
  }
}

class ChangeEmailController extends GetxController {
  final EmailService emailService = Get.put(EmailService());

  Future<void> changeEmail(String email, String code) async {
    final response = await emailService.changeEmail(email, code);

    if (response != null && response['status'] == true) {
      Get.snackbar(
        'Success',
        'Success change email',
        backgroundColor: Success.mainColor,
        colorText: Neutral.light4,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to change email',
        backgroundColor: Error.mainColor,
        colorText: Neutral.dark1,
      );
    }
  }

  void sendOtp(String text) {}
}
