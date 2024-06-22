import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../controllers/meditation_controller.dart';
import '../components/article_card.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MeditationController>();
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage}'));
        } else {
          final likedArticle =
              controller.articles.where((article) => article.isLiked).toList();

          if (likedArticle.isEmpty) {
            return Center(child: Text('No liked articles found.'));
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              itemCount: likedArticle.length,
              itemBuilder: (context, index) {
                final articles = likedArticle[index];
                return ArticleCard(
                  image: articles.imageUrl,
                  title: articles.title,
                  time: controller.formatDateTime(articles.date),
                  readTime: 'bacaan ${articles.content.length ~/ 10} menit',
                  onTap: () {
                    Get.toNamed(
                      Routes.ARTICLE,
                      arguments: {
                        'idArticle': articles.id,
                        'title': articles.title,
                        'image': articles.imageUrl,
                        'content': articles.content,
                        'date': controller.formatDateTime(articles.date),
                        'like': articles.isLiked,
                      },
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
