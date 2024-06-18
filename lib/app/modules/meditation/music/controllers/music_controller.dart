import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  RxString musicUrl = ''.obs;
  RxString imageUrl = ''.obs;
  RxString title = ''.obs;
  RxString artist = ''.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> duration = Duration.zero.obs;
  final player = AudioPlayer();

  String formatDuration(Duration d) {
    minutes.value = d.inMinutes.remainder(60);
    seconds.value = d.inSeconds.remainder(60);
    return "${minutes.value.toString().padLeft(2, '0')}:${seconds.value.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  @override
  void onInit() {
    final arg = Get.arguments;
    musicUrl.value = arg['url'];
    imageUrl.value = arg['image'];
    title.value = arg['title'];
    artist.value = arg['singer'];

    player.setUrl(musicUrl.value);

    player.positionStream.listen((p) {
      position.value = p;
    });

    player.durationStream.listen((d) {
      duration.value = d!;
    });

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        position.value = Duration.zero;
        player.pause();
        player.seek(Duration.zero);
      }
    });
    super.onInit();
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
