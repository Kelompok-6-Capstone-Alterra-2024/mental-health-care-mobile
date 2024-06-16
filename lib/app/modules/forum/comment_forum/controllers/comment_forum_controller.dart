import 'package:get/get.dart';

import '../data/models/post_by_id_model.dart';
import '../data/services/post_by_id_service.dart';

class CommentForumController extends GetxController {
  final PostByIdService _postByIdService = PostByIdService();

  Rx<PostByIdModel?> post = Rx<PostByIdModel?>(null);
  RxBool isLoading = false.obs;
  RxBool isCommentClicked = false.obs;
  RxBool isLiked = false.obs;
  RxBool isShared = false.obs;

  @override
  void onInit() {
    super.onInit();
    final postId = Get.arguments as int;
    fetchPostById(postId);
  }

  void fetchPostById(int postId) async {
    isLoading.value = true;
    try {
      final fetchedPost = await _postByIdService.getPostById(postId);
      post.value = fetchedPost;
    } catch (e) {
      print('Error fetching post by id: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleCommentButton() {
    isCommentClicked.value = !isCommentClicked.value;
  }

  void toggleLikeButton() {
    isLiked.value = !isLiked.value;
  }

  void toggleShareButton() {
    isShared.value = !isShared.value;
  }
}
