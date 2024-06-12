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
                final article = controller.articles[index];
                return ArticleCard(
                  image: article.imageUrl,
                  title: article.title,
                  time: article.date.toString(),
                  readTime: 'bacaan ${article.content.length ~/ 10} menit',
                  onTap: () {
                    Get.toNamed(Routes.ARTICLE,
                        arguments: {'articleID': article.id});
                    print('Article ID: ${article.id}');
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
