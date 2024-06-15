import 'package:get/get.dart';
import '../data/models/joined_forum_model.dart';
import '../data/services/joined_forum_service.dart';
import '../data/services/recommendation_forum_service.dart';
import '../data/models/recommendation_forum_model.dart';
import '../data/services/join_forum_service.dart';

class ForumController extends GetxController {
  var joinedForums = <JoinedForum>[].obs;
  var recommendationForums = <RecommendationForum>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final JoinedForumService _joinedForumService = JoinedForumService();
  final RecommendationForumService _recommendationForumService =
      RecommendationForumService();
  final JoinForumService _joinForumService = JoinForumService();

  void fetchJoinedForums() async {
    try {
      isLoading(true);
      var forumResponse = await _joinedForumService.getJoinedForums();
      joinedForums(forumResponse.data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchRecommendationForums() async {
    try {
      isLoading(true);
      var forumResponse =
          await _recommendationForumService.getRecommendationForums();
      recommendationForums(forumResponse.data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void joinForum(int forumId) async {
    try {
      isLoading(true);
      await _joinForumService.joinForum(forumId);
      fetchJoinedForums();
      fetchRecommendationForums();
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchJoinedForums();
    fetchRecommendationForums();
  }
}
