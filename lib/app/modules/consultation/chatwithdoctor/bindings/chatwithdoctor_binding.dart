import 'package:get/get.dart';

import '../controllers/chatwithdoctor_controller.dart';

class ChatwithdoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatwithdoctorController>(
      () => ChatwithdoctorController(),
    );
  }
}

