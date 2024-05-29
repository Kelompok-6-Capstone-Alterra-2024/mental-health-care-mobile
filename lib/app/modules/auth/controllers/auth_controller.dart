import 'package:get/get.dart';

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

  validatePassword(String? pwd) {
    if (pwd!.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }
}
