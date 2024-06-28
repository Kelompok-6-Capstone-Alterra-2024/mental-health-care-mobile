// controllers/password_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/constant/constant.dart';
import '../data/models/change_password_model.dart';
import '../data/services/change_password_service.dart';

class PasswordController extends GetxController {
  var isLoading = false.obs;
  var statusMessage = ''.obs;
  final PasswordService passwordService;

  PasswordController(this.passwordService);

  Future<void> resetPassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    isLoading(true);

    final passwordModel = PasswordModel(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    final result = await passwordService.resetPassword(passwordModel);

    if (result['success'] == true) {
      Get.snackbar('Success', 'Password berhasil diganti');
    } else {
      Get.snackbar(
        'Success',
        result['message'],
        backgroundColor: Success.mainColor,
        colorText: Neutral.light4,
      );
    }

    statusMessage.value = result['message'] ?? "Unknown error occurred";

    isLoading(false);
  }
}
