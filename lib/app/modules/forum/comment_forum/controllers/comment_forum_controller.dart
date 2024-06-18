import 'package:get/get.dart';

import '../data/models/comment_post_model.dart';
import '../data/models/post_by_id_model.dart';
import '../data/services/comment_post_service.dart';
import '../data/services/post_by_id_service.dart';

class CommentForumController extends GetxController {
  final PostByIdService _postByIdService = PostByIdService();
  final CommentPostService _commentPostService = CommentPostService();

  Rx<PostByIdModel?> post = Rx<PostByIdModel?>(null);
  Rx<CommentPostModel?> comments = Rx<CommentPostModel?>(null);
  RxBool isLoading = false.obs;
  RxBool isCommentClicked = false.obs;
  RxBool isLiked = false.obs;
  RxBool isShared = false.obs;
  RxBool isLoadingComments = false.obs;

  @override
  void onInit() {
    super.onInit();
    final postId = Get.arguments as int;
    fetchPostById(postId);
    fetchComments(postId);
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

  void fetchComments(int postId) async {
    isLoadingComments.value = true;
    try {
      final fetchedComments = await _commentPostService.getComments(postId);
      comments.value = fetchedComments;
    } catch (e) {
      print('Error fetching comments: $e');
    } finally {
      isLoadingComments.value = false;
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
