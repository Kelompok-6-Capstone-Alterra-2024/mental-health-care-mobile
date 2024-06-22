import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/meditation_controller.dart';
import '../components/music_card.dart';

class MusicTab extends GetView<MeditationController> {
  const MusicTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Skeletonizer(
          enabled: controller.isLoading.value,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              itemCount: controller.musics.length,
              itemBuilder: (context, index) {
                final musics = controller.musics[index];
                return MusicCard(
                  image: musics.imageUrl,
                  title: musics.title,
                  artist: musics.singer,
                  isLiked: musics.isLiked,
                  isLoading: controller.isLoading.value,
                  onLikeTap: () {
                    controller.toggleLikeStatus(index);
                  },
                  onTap: () {
                    Get.toNamed(Routes.MUSIC, arguments: {
                      'musicID': musics.id,
                      'url': musics.musicUrl,
                      'image': musics.imageUrl,
                      'title': musics.title,
                      'singer': musics.singer,
                      'isLiked': musics.isLiked,
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
