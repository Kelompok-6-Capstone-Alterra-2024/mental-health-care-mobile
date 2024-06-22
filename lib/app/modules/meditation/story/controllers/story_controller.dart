import 'package:get/get.dart';

import '../../data/services/story_service.dart';

class StoryController extends GetxController {
  final StoryService _storyService = StoryService();

  RxInt storyID = 0.obs;
  RxString title = ''.obs;
  RxString image = ''.obs;
  RxString content = ''.obs;
  RxString author = ''.obs;
  RxString date = ''.obs;
  RxBool isLiked = false.obs;

  Future<void> toggleLikeStatus() async {
    try {
      bool success =
          await _storyService.toggleLikeStatus(storyID.value, isLiked.value);
      if (success) {
        isLiked.value = !isLiked.value;
        Get.snackbar(
          'Success',
          isLiked.value
              ? 'Like added successfully'
              : 'Like removed successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to toggle like status',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Failed to update like status',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onInit() {
    final arg = Get.arguments;
    storyID.value = arg['idStory'];
    title.value = arg['title'];
    image.value = arg['image'];
    content.value = arg['content'];
    author.value = arg['author'];
    date.value = arg['date'].toString();
    isLiked.value = arg['like'];
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
