import 'package:get/get.dart';
import 'package:mindease/app/modules/forum/controllers/forum_controller.dart';
import 'package:mindease/app/modules/home/controllers/home_controller.dart';
import 'package:mindease/app/modules/meditation/controllers/meditation_controller.dart';

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
    Get.lazyPut<ForumController>(
      () => ForumController(),
    );
    Get.lazyPut<MeditationController>(
      () => MeditationController(),
    );
  }
}
