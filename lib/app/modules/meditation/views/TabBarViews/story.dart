import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../components/story_card.dart';

class StoryTab extends StatelessWidget {
  const StoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23.5),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return StoryCard(
            image: 'assets/images/1.png',
            title: 'The Power of Meditation',
            author: 'Luna Grace',
            time: '5 min',
            like: () {},
            onTap: () {
              Get.toNamed(Routes.STORY);
            },
          );
        },
      ),
    );
  }
}
