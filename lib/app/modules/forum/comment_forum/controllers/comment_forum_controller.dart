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
      isLiked.value = fetchedPost.data.isLiked;
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

  Future<void> postComment(int postId, String content) async {
    try {
      await _commentPostService.postComment(postId, content);
      fetchComments(postId);
    } catch (e) {
      print('Error posting comment: $e');
    }
  }

  Future<void> likePost(int postId) async {
    try {
      await _postByIdService.likePost(postId);
      isLiked.value = true;
    } catch (e) {
      print('Error liking post: $e');
    }
  }

  void toggleCommentButton() {
    isCommentClicked.value = !isCommentClicked.value;
  }

  void toggleLikeButton() {
    isLiked.value = !isLiked.value;
    if (isLiked.value) {
      likePost(post.value!.data.id);
    }
  }

  void toggleShareButton() {
    isShared.value = !isShared.value;
  }
}
