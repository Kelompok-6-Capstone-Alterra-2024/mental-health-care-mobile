import 'package:get/get.dart';

import '../controllers/mood_track_controller.dart';

class MoodTrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoodTrackController>(
      () => MoodTrackController(),
    );
  }
}
