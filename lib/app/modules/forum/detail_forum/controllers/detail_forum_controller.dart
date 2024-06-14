import 'package:get/get.dart';

import '../data/models/forum_by_id_model.dart';
import '../data/services/forum_by_id_service.dart';

class DetailForumController extends GetxController {
  final ForumByIdService _forumByIdService = ForumByIdService();

  Rx<ForumByIdModel?> forumById = Rx<ForumByIdModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchForumById(2);
  }

  void fetchForumById(int forumId) async {
    try {
      final forum = await _forumByIdService.getForumById(forumId);
      forumById.value = forum;
    } catch (e) {
      print('Error fetching forum by id: $e');
    }
  }
}
