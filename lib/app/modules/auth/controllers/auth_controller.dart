import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxString icon = ''.obs;
  RxBool obscureText = true.obs;

  validatePassword(String? pwd) {
    if (pwd!.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  void setUsername(String value) {
    username.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }
}
