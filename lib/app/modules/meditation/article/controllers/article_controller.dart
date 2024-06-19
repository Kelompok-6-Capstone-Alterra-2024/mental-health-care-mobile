import 'package:get/get.dart';

import '../../data/services/article_service.dart';

class ArticleController extends GetxController {
  final ArticleService _articleService = ArticleService();

  RxInt articleID = 0.obs;
  RxString title = ''.obs;
  RxString image = ''.obs;
  RxString content = ''.obs;
  RxString date = ''.obs;
  RxBool isLiked = false.obs;

  @override
  void onInit() {
    final arg = Get.arguments;
    articleID.value = arg['idArticle'];
    title.value = arg['title'];
    image.value = arg['image'];
    content.value = arg['content'];
    date.value = arg['date'].toString();
    isLiked.value = arg['like'];
    super.onInit();
  }

  Future<void> toggleLikeStatus() async {
    try {
      bool success = await _articleService.toggleLikeStatus(articleID.value);
      if (success) {
        isLiked.value = !isLiked.value;
        Get.snackbar(
          'Success',
          'Like status updated successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to update like status',
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
