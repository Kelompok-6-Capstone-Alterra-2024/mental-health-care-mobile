import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/meditation_controller.dart';
import '../components/music_card.dart';

class MusicTab extends GetView<MeditationController> {
  const MusicTab({super.key});

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
              itemCount: controller.musics.length,
              itemBuilder: (context, index) {
                final musics = controller.musics[index];
                return MusicCard(
                  image: musics.imageUrl,
                  title: musics.title,
                  artist: musics.singer,
                  isLiked: musics.isLiked,
                  onLikeTap: () {
                    musics.isLiked = !musics.isLiked;
                    controller.musics
                        .refresh(); // Refresh the list to update UI
                  },
                  onTap: () {
                    Get.toNamed(Routes.MUSIC, arguments: {
                      'musicID': musics.id,
                      'url': musics.musicUrl,
                      'image': musics.imageUrl,
                      'title': musics.title,
                      'singer': musics.singer,
                    });
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
