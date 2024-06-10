import 'package:get/get.dart';

import '../controllers/comment_forum_controller.dart';

class CommentForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentForumController>(
      () => CommentForumController(),
    );
  }
}
