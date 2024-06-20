import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/meditation_controller.dart';
import '../components/story_card.dart';

class StoryTab extends GetView<MeditationController> {
  const StoryTab({super.key});

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
              itemCount: controller.storys.length,
              itemBuilder: (context, index) {
                final storys = controller.storys[index];
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
