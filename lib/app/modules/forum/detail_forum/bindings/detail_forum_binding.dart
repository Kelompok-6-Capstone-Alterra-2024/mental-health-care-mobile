import 'package:get/get.dart';

import '../controllers/detail_forum_controller.dart';

class DetailForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailForumController>(
      () => DetailForumController(),
    );
  }
}
