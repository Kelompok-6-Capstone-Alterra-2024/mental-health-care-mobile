import 'package:get/get.dart';
import '../data/models/recommendation_forum_model.dart';
import '../data/services/recommendation_forum_service.dart';

class ForumController extends GetxController {
  var recommendationForums = <RecommendationForum>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final RecommendationForumService _recommendationForumService =
      RecommendationForumService();

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

  @override
  void onInit() {
    super.onInit();
    fetchRecommendationForums();
  }
}
