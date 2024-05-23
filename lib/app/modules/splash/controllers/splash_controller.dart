import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final getStore = GetStorage().read('id');

  @override
  void onReady() {
    super.onReady();
    if (getStore == null || getStore == 0) {
      Future.delayed(const Duration(seconds: 4), () {
        Get.offNamed(Routes.ONBOARDING);
      });
    } else {
      Get.offNamed(Routes.HOME);
    }
  }
}
