import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../controllers/forum_controller.dart';
import '../data/models/forum_by_id_model.dart';
import '../data/services/forum_by_id_service.dart';
import '../data/models/posts_model.dart';
import '../data/services/leave_forum_service.dart';
import '../data/services/posts_service.dart';

class DetailForumController extends GetxController {
  final ForumByIdService _forumByIdService = ForumByIdService();
  final PostService _postService = PostService();
  final LeaveForumService _leaveForumService = LeaveForumService();
  final ForumController _forumController = Get.find();
  Rx<ForumByIdModel?> forumById = Rx<ForumByIdModel?>(null);
  RxList<AllPost> posts = RxList<AllPost>([]);
  RxString note = ''.obs;
  Rx<File?> imageFile = Rx<File?>(null);
  RxBool isLoading = false.obs;
  RxBool isLiked = false.obs;

  void onNote(String value) {
    note.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    final forumId = Get.arguments as int;
    fetchForumById(forumId);
    fetchPostsByForumId(forumId);
  }

  void fetchForumById(int forumId) async {
    isLoading.value = true;
    try {
      final forum = await _forumByIdService.getForumById(forumId);
      forumById.value = forum;
    } catch (e) {
      print('Error fetching forum by id: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void fetchPostsByForumId(int forumId) async {
    isLoading.value = true;
    try {
      final postsData = await _postService.getAllPostsByForumId(forumId);
      posts.assignAll(postsData.data);
    } catch (e) {
      print('Error fetching posts by forum id: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      imageFile.value = File(result.files.single.path!);
    }
  }

  void postForum() async {
    isLoading.value = true;

    try {
      await _postService.createPost(
        forumId: forumById.value!.data.forumId,
        content: note.value,
        imageFile: imageFile.value,
      );
      fetchPostsByForumId(forumById.value!.data.forumId);
      Get.back();
    } catch (e) {
      print('Error posting forum: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void leaveForum() async {
    isLoading.value = true;

    try {
      await _leaveForumService.leaveForum(forumById.value!.data.forumId);
      _forumController.fetchJoinedForums();
      _forumController.fetchRecommendationForums();
      Get.back();
    } catch (e) {
      print('Error leaving forum: $e');
    } finally {
      isLoading.value = false;
    }
  }

  bool isPostLiked(int postId) {
    return posts.any((post) => post.id == postId && post.isLiked);
  }

  void updatePostLikedStatus(int postId, bool isLiked) {
    final index = posts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      posts[index].isLiked = isLiked;
      posts.refresh();
    }
  }

  void likePost(int postId) async {
    try {
      await _postService.likePost(postId);
      updatePostLikedStatus(postId, true);
    } catch (e) {
      print('Error liking post: $e');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
