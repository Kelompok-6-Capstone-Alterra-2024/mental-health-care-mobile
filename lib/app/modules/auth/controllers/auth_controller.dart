import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/data/services/auth_service.dart';
import 'package:mindease/constant/constant.dart';

import '../../../routes/app_pages.dart';
import '../mixins/forgot_password_mixin.dart';
import '../mixins/verification_code_mixin.dart';

class AuthController extends GetxController
    with VerificationCodeMixin, ForgetPasswordMixin {
  RxString usernameL = ''.obs;
  RxString usernameR = ''.obs;
  RxString emailR = ''.obs;
  RxString passwordL = ''.obs;
  RxString passwordR = ''.obs;
  RxString confirmPasswordR = ''.obs;
  RxBool obscureText = true.obs;
  RxString icon = ''.obs;
  RxString passwordError = ''.obs;
  RxBool isFormValid = false.obs;

  final formKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

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
    if (pwd != passwordR.value) {
      return 'Password yang kamu masukkan berbeda!';
    }
    return null;
  }

  void setUserNameL(String value) {
    usernameL.value = value;
    validateForm();
  }

  void setPasswordL(String value) {
    passwordL.value = value;
    validateForm();
  }

  void setEmailR(String value) {
    emailR.value = value;
    validateRegisterForm();
  }

  void setUserNameR(String value) {
    usernameR.value = value;
    validateRegisterForm();
  }

  void setPasswordR(String value) {
    passwordR.value = value;
    validateRegisterForm();
  }

  void setConfirmPasswordR(String value) {
    confirmPasswordR.value = value;
    validateRegisterForm();
  }

  void validateForm() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  void validateRegisterForm() {
    isFormValid.value = registerFormKey.currentState?.validate() ?? false;
  }

  Future<void> doLogin() async {
    bool isValidate = formKey.currentState!.validate();
    if (!isValidate) {
      return;
    }

    bool isSuccess = await AuthService().login(
      username: usernameL.value,
      password: passwordL.value,
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
    Get.offAllNamed(Routes.NAVIGATION);
  }

  Future<void> doRegister() async {
    bool isValidate = registerFormKey.currentState!.validate();
    if (!isValidate) {
      return;
    }

    bool isSuccess = await AuthService().register(
      username: usernameR.value,
      password: passwordR.value,
      email: emailR.value,
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
    Get.offAllNamed(Routes.NAVIGATION);
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
