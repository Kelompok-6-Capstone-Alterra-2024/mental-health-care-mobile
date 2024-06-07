import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../components/article_card.dart';

class ArticleTab extends StatelessWidget {
  const ArticleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ArticleCard(
            image: 'assets/images/2.png',
            title: 'The Power of Meditation',
            time: '2 hours ago',
            readTime: '5 min read',
            onTap: () {
              Get.toNamed(Routes.ARTICLE);
            },
          );
        },
      ),
    );
  }
}
