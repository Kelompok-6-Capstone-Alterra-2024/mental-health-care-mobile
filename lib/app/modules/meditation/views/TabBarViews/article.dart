import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/meditation_controller.dart';
import '../components/article_card.dart';

class ArticleTab extends GetView<MeditationController> {
  const ArticleTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage}'));
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              itemCount: controller.articles.length,
              itemBuilder: (context, index) {
                final articles = controller.articles[index];
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
