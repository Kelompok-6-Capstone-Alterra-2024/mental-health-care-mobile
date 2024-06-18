import 'package:get/get.dart';

import '../controllers/poin_controller.dart';

class PoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoinController>(
      () => PoinController(),
    );
  }
}
