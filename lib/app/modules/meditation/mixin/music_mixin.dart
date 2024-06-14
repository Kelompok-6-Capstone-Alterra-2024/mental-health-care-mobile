import 'package:get/get.dart';

import '../data/models/musics_model.dart';
import '../data/services/music_service.dart';

mixin MusicMixin on GetxController {
  var musics = <AllMusic>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  late MusicService _MusicService;

  void fetchMusics() async {
    try {
      isLoading(true);
      var musicResponse = await _MusicService.getMusics();
      musics(musicResponse.data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _MusicService = MusicService();
    fetchMusics();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
