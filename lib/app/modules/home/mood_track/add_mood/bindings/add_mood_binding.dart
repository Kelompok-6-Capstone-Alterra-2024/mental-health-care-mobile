import 'package:get/get.dart';

import '../controllers/add_mood_controller.dart';

class AddMoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMoodController>(
      () => AddMoodController(),
    );
  }
}
