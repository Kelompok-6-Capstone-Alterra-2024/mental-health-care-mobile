import 'package:get/get.dart';

import '../data/models/articles_model.dart';
import '../data/services/article_service.dart';

mixin ArticleMixin on GetxController {
  var articles = <AllArticle>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  late ArticleService _articleService;
 
  void fetchArticles() async {
    try {
      isLoading(true);
      var articleResponse = await _articleService.getAllArticles();
      articles(articleResponse.data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _articleService = ArticleService();
    fetchArticles();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
