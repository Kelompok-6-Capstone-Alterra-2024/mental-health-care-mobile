import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/meditation/story/controllers/story_controller.dart';

import '../../../../../routes/app_pages.dart';
import '../../../controllers/meditation_controller.dart';
import '../components/story_card.dart';

class WidgetDetailStory extends GetView<StoryController> {
  const WidgetDetailStory({super.key});

  @override
  Widget build(BuildContext context) {
    final meditasiC = Get.find<MeditationController>();
    return Obx(
      () {
        if (meditasiC.isLoading.value) {
          return const Center(child: const CircularProgressIndicator());
        } else if (meditasiC.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${meditasiC.errorMessage}'));
        } else {
          final storysFilter = meditasiC.storys
              .where((story) => story.id != controller.storyID.value)
              .toList();
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              itemCount: storysFilter.length,
              itemBuilder: (context, index) {
                final storys = storysFilter[index];
                return StoryCard(
                  image: storys.imageUrl,
                  title: storys.title,
                  author: storys.doctor.name,
                  time: meditasiC.formatDateTime(storys.date),
                  onTap: () {
                    Get.toNamed(
                      Routes.STORY,
                      arguments: {
                        'idStory': storys.id,
                        'title': storys.title,
                        'image': storys.imageUrl,
                        'content': storys.content,
                        'author': storys.doctor.name,
                        'date': meditasiC.formatDateTime(storys.date),
                        'like': storys.isLiked,
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
