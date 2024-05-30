import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/data/services/auth_service.dart';
import 'package:mindease/constant/constant.dart';

import '../../../routes/app_pages.dart';
import '../mixins/forget_password_mixin.dart';
import '../mixins/verification_code_mixin.dart';

class AuthController extends GetxController
    with VerificationCodeMixin, ForgetPasswordMixin {
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxBool obscureText = true.obs;
  RxString icon = ''.obs;

  final formKey = GlobalKey<FormState>();

  validateUsername(String? username) {
    if (username!.isEmpty) {
      return 'Username tidak boleh kosong';
    }
    return null;
  }

  validateEmail(String? email) {
    if (email != null && !GetUtils.isEmail(email)) {
      return 'Email tidak valid';
    }
    return null;
  }

  validatePassword(String? pwd) {
    if (pwd!.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  validateConfirmPassword(String? pwd) {
    if (pwd != password.value) {
      return 'Password tidak sama';
    }
    return null;
  }

  void setUserName(String value) {
    username.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  Future<void> doLogin() async {
    bool isValidate = formKey.currentState!.validate();
    if (!isValidate) {
      return;
    }

    bool isSuccess = await AuthService().login(
      username: username.value,
      password: password.value,
    );

    if (!isSuccess) {
      _showSnackbar(
        title: 'Error',
        message: 'Login Failed',
        color: Color(Error.mainColor.value),
      );
      return;
    }

    _showSnackbar(
      title: 'Success',
      message: 'Login Success',
      color: Color(Success.mainColor.value),
    );
    Get.offAllNamed(Routes.HOME);
  }

  void _showSnackbar({
    required String title,
    required String message,
    required Color color,
  }) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: color.withOpacity(0.8),
    );
  }
}
