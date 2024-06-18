import 'package:get/get.dart';

class StoryController extends GetxController {
  RxInt storyID = 0.obs;
  RxString title = ''.obs;
  RxString image = ''.obs;
  RxString content = ''.obs;
  RxString author = ''.obs;
  RxString date = ''.obs;
  RxBool isLiked = false.obs;

  final arg = Get.arguments;

  @override
  void onInit() {
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
