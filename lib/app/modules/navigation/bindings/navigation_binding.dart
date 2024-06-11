import 'package:get/get.dart';
import 'package:mindease/app/modules/home/controllers/home_controller.dart';
import 'package:mindease/app/modules/meditation/controllers/meditation_controller.dart';
import 'package:mindease/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MeditationController>(
      () => MeditationController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
