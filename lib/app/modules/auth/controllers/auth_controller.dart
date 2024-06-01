import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/data/services/auth_service.dart';
import 'package:mindease/constant/constant.dart';

import '../../../routes/app_pages.dart';
import '../mixins/forgot_password_mixin.dart';
import '../mixins/verification_code_mixin.dart';

class AuthController extends GetxController
    with VerificationCodeMixin, ForgetPasswordMixin {
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxBool obscureText = true.obs;
  RxString icon = ''.obs;
  RxString passwordError = ''.obs;

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
      return 'Password yang kamu masukan berbeda!';
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
      passwordError.value = 'Password yang anda masukkan salah!';
      formKey.currentState!.validate();
      return;
    }

    _showSnackbar(
      title: 'Success',
      message: 'Berhasil Login',
      color: Color(Success.mainColor.value),
    );
    Get.offAllNamed(Routes.HOME);
  }

  Future<void> doRegister() async {
    bool isValidate = formKey.currentState!.validate();
    if (!isValidate) {
      return;
    }

    bool isSuccess = await AuthService().register(
      username: username.value,
      password: password.value,
      email: email.value,
    );

    if (!isSuccess) {
      _showSnackbar(
        title: 'Error',
        message: 'Username atau Email sudah terdaftar',
        color: Color(Error.mainColor.value),
      );
      return;
    }

    _showSnackbar(
      title: 'Success',
      message: 'Berhasil Register',
      color: Color(Success.mainColor.value),
    );
    Get.offAllNamed(Routes.LOGIN);
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
