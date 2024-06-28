import 'package:get/get.dart';

import '../data/models/musics_model.dart';
import '../data/services/music_service.dart';

mixin MusicMixin on GetxController {
  var musics = <AllMusic>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  late MusicService _musicService;

  void fetchMusics() async {
    try {
      isLoading(true);
      var musicResponse = await _musicService.getMusics();
      musics(musicResponse.data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> toggleLikeStatus(
    int index,
  ) async {
    try {
      AllMusic music = musics[index];
      bool success =
          await _musicService.toggleLikeStatus(music.id, music.isLiked);
      print(music.id);
      print(music.isLiked);
      print(music.title);
      if (success) {
        music.isLiked = !music.isLiked;
        musics[index] = music;
        Get.snackbar(
          'Success',
          music.isLiked
              ? 'Like added successfully'
              : 'Like removed successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
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
  void onInit() {
    super.onInit();
    _musicService = MusicService();
    fetchMusics();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
