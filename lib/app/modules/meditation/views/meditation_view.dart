import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/meditation_controller.dart';
import 'TabBarViews/article.dart';
import 'TabBarViews/music.dart';
import 'TabBarViews/story.dart';

class MeditationView extends GetView<MeditationController> {
  const MeditationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            '${controller.tabNameTitle}',
            style: medium.copyWith(fontSize: 16, color: Primary.darker),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/Heart.svg',
              width: 24,
            ),
            onPressed: () {
              Get.toNamed(Routes.WISHLIST);
            },
            padding: const EdgeInsets.only(
              right: 16,
              left: 59,
            ),
            splashColor: Neutral.transparent,
            highlightColor: Neutral.transparent,
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFormField(
              style: light.copyWith(
                fontSize: 14,
                color: Neutral.dark1,
              ),
              decoration: searchStyle.copyWith(
                hintText: 'Temukan meditasimu disini',
                prefixIcon: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  width: 16,
                  height: 16,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 50,
                ),
              ),
            ),
          ),
          const Gap(26),
          Container(
            padding: const EdgeInsets.only(left: 25),
            child: Obx(
              () => TabBar(
                controller: controller.tabController,
                labelColor: Primary.mainColor,
                labelPadding: const EdgeInsets.only(right: 32),
                unselectedLabelColor: Neutral.dark2,
                dividerColor: Neutral.transparent,
                tabAlignment: TabAlignment.start,
                overlayColor: MaterialStateProperty.all(Neutral.transparent),
                isScrollable: true,
                indicatorColor: Primary.mainColor,
                onTap: (index) {
                  controller.tabController.animateTo(index);
                },
                tabs: List.generate(
                  controller.tabs.length,
                  (index) => Tab(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          controller.getTabIcon(index),
                          width: 24,
                          height: 24,
                          color: controller.currentTab.value == index
                              ? Primary.mainColor
                              : Neutral.dark2,
                        ),
                        const Gap(10),
                        Text(
                          '${controller.tabs[index]}',
                          style: medium.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(32),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                const MusicTab(),
                const ArticleTab(),
                const StoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
