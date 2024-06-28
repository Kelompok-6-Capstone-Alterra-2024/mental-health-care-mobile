import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/meditation/wishlist/views/widget/widget_story.dart';

import '../../../../../constant/constant.dart';
import '../controllers/wishlist_controller.dart';
import 'widget/filter_bottom.dart';
import 'widget/widget_article.dart';
import 'widget/widget_music.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron Left.svg',
            width: 24,
          ),
          constraints: const BoxConstraints(minWidth: 50),
          onPressed: () {
            controller.meditasiC.fetchMusics();
            Get.back();
          },
          padding: const EdgeInsets.only(left: 16),
          splashColor: Neutral.transparent,
          highlightColor: Neutral.transparent,
        ),
        title: Text(
          'Meditasi Yang Anda Suka',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/Filter.svg',
              width: 24,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => FilterBottomSheet(),
              );
            },
            padding: const EdgeInsets.only(right: 16),
            splashColor: Neutral.transparent,
            highlightColor: Neutral.transparent,
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () {
            if (controller.selectedCategory.value == 'musik') {
              return const MusicWidget();
            } else if (controller.selectedCategory.value == 'artikel') {
              return const ArticleWidget();
            } else if (controller.selectedCategory.value ==
                'cerita inspiratif') {
              return const StoryWidget();
            } else {
              return Text(
                'No items found for ${controller.selectedCategory.value}',
                style: const TextStyle(fontSize: 20),
              );
            }
          },
        ),
      ),
    );
  }
}
