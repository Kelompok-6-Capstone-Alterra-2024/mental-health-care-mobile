import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/meditation/wishlist/controllers/wishlist_controller.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/meditation_controller.dart';
import '../components/music_card.dart';

class MusicWidget extends GetView<WishlistController> {
  const MusicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final meditasiC = Get.find<MeditationController>();
    return Obx(
      () {
        if (meditasiC.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (meditasiC.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${meditasiC.errorMessage}'));
        } else {
          final likedMusics = controller.likedmusics;

          if (likedMusics.isEmpty) {
            return Center(child: Text('No liked musics found.'));
          }

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              itemCount: likedMusics.length,
              itemBuilder: (context, index) {
                final musics = likedMusics[index];
                return MusicCard(
                  image: musics.imageUrl,
                  title: musics.title,
                  artist: musics.singer,
                  isLiked: musics.isLiked,
                  onLikeTap: () {
                    print(musics.id);
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
          );
        }
      },
    );
  }
}
