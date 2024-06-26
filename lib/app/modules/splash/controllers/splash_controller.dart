import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final _storage = GetStorage();
  String? token;

  @override
  void onInit() {
    super.onInit();
    token = _storage.read('token');
  }

  @override
  void onReady() {
    super.onReady();
    _navigateBasedOnToken();
  }

  // void _navigateBasedOnToken() async {
  //   if (token == null || token!.isEmpty) {
  //     Future.delayed(const Duration(seconds: 2), () {
  //       Get.offNamed(Routes.ONBOARDING);
  //     });
  //   } else {
  //     Get.offNamed(Routes.NAVIGATION);
  //   }
  // }

  void _navigateBasedOnToken() async {
    Future.delayed(const Duration(seconds: 2), () {
      if (token == null || token!.isEmpty) {
        Get.offNamed(Routes.ONBOARDING);
      } else {
        Get.offNamed(Routes.NAVIGATION);
      }
    });
  }


}
