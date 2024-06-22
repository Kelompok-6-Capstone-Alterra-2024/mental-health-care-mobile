import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../controllers/meditation_controller.dart';
import '../components/story_card.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

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
          final likedStorys =
              controller.storys.where((story) => story.isLiked).toList();

          if (likedStorys.isEmpty) {
            return Center(child: Text('No liked storys found.'));
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              itemCount: likedStorys.length,
              itemBuilder: (context, index) {
                final storys = likedStorys[index];
                return StoryCard(
                  image: storys.imageUrl,
                  title: storys.title,
                  author: storys.doctor.name,
                  time: controller.formatDateTime(storys.date),
                  onTap: () {
                    Get.toNamed(
                      Routes.STORY,
                      arguments: {
                        'idStory': storys.id,
                        'title': storys.title,
                        'image': storys.imageUrl,
                        'content': storys.content,
                        'author': storys.doctor.name,
                        'date': controller.formatDateTime(storys.date),
                        'like': storys.isLiked,
                      },
                    );
                  },
                  like: () => 'like',
                );
              },
            ),
          );
        }
      },
    );
  }
}
