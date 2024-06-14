import 'package:get/get.dart';

import '../../data/services/story_service.dart';

class StoryController extends GetxController {
  RxInt storyID = 0.obs;
  RxString storyTitle = ''.obs;
  RxString storyContent = ''.obs;
  RxString storyImage = ''.obs;
  RxString storyCreatedAt = ''.obs;
  RxBool isLiked = false.obs;
  RxString doctor = ''.obs;

  Future<void> fetchstory() async {
    final storyService = StoryService();
    await storyService.getStory(storyID.value).then(
      (value) {
        storyTitle.value = value.data.title;
        storyContent.value = value.data.content;
        storyImage.value = value.data.imageUrl;
        storyCreatedAt.value = value.data.date.toString();
        isLiked.value = value.data.isLiked;
        doctor.value = value.data.doctor.name;
      },
    );
  }

  @override
  void onInit() {
    final arg = Get.arguments as Map<String, dynamic>;
    storyID.value = arg['storyID'];
    print('story ID: ${storyID.value}');
    fetchstory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
