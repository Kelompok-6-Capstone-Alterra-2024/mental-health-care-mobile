import 'package:get/get.dart';
import 'package:mindease/app/modules/meditation/data/services/article_service.dart';

import '../../data/models/article_model.dart';

class ArticleController extends GetxController {
  RxInt articleID = 0.obs;
  RxString articleTitle = ''.obs;
  RxString articleContent = ''.obs;
  RxString articleImage = ''.obs;
  RxString articleCreatedAt = ''.obs;
  RxBool isLiked = false.obs;
  RxString doctor = ''.obs;
  var article = <Data>[].obs;

  Future<void> fetchArticleById() async {
    final articleService = ArticleService();
    await articleService.getArticleById(articleID.value).then(
      (value) {
        articleTitle.value = value.data.title;
        articleContent.value = value.data.content;
        articleImage.value = value.data.imageUrl;
        articleCreatedAt.value = value.data.date.toString();
        isLiked.value = value.data.isLiked;
        doctor.value = value.data.doctor.name;
      },
    );
  }

  @override
  void onInit() {
    final arg = Get.arguments as Map<String, dynamic>;
    articleID.value = arg['articleID'];
    print('Article ID: ${articleID.value}');
    fetchArticleById();
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
