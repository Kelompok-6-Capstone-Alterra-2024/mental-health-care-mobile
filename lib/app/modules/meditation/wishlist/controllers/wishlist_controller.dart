import 'package:get/get.dart';

import '../../controllers/meditation_controller.dart';
import '../../data/models/musics_model.dart';
import '../../data/services/music_service.dart';

class WishlistController extends GetxController {
  final MusicService _musicService = MusicService();
  RxString selectedCategory = 'musik'.obs;
  RxList likedmusics = <AllMusic>[].obs;
  MeditationController meditasiC = Get.find<MeditationController>();

  @override
  void onInit() {
    likedmusics
        .assignAll(meditasiC.musics.where((music) => music.isLiked).toList());
    super.onInit();
  }

  void updateSelectedCategory(String category) {
    selectedCategory.value = category;
  }

  Future<void> toggleLikeStatus(int index) async {
    try {
      AllMusic music = likedmusics[index];
      bool success =
          await _musicService.toggleLikeStatus(music.id, music.isLiked);
      if (success) {
        music.isLiked = !music.isLiked;
        if (!music.isLiked) {
          likedmusics.removeAt(index);
        }
        Get.snackbar(
          'Success',
          music.isLiked
              ? 'Like added successfully'
              : 'Like removed successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
        update();
      } else {
        Get.snackbar(
          'Error',
          'Failed to toggle like status',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Failed to update like status',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
