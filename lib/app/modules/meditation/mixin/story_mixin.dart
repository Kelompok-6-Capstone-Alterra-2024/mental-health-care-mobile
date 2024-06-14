import 'package:get/get.dart';
import 'package:mindease/app/modules/meditation/data/models/storys_model.dart';

import '../data/services/story_service.dart';

mixin StoryMixin on GetxController {
  var storys = <AllStory>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  late StoryService _storyService;

  void fetchStorys() async {
    try {
      isLoading(true);
      var storyResponse = await _storyService.getStorys();
      storys(storyResponse.data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _storyService = StoryService();
    fetchStorys();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
