import 'package:get/get.dart';

class ArticleController extends GetxController {
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
