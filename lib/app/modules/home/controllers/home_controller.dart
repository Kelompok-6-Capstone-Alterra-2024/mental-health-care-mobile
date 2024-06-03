import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final _storage = GetStorage();

  void logout() {
    AuthService.token = null;
    _storage.remove('token');
    Logger().i('Logged out');
    Get.offAllNamed(Routes.ONBOARDING);
  }
}
