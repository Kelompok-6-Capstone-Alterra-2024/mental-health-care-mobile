// ignore_for_file: use_super_parameters

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/meditation_controller.dart';
import '../controllers/music_controller.dart';

class MusicView extends GetView<MusicController> {
  const MusicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final meditasiC = Get.put(MeditationController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            meditasiC.fetchMusics();
            Get.back();
          },
        ),
        title: Text(
          'Musik Meditasi',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.only(
            top: 92,
            left: 25,
            right: 25,
            bottom: 72,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.network(
                  controller.imageUrl.value,
                  width: double.infinity,
                  height: 317,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/Share 3.svg',
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    iconSize: 18,
                    alignment: Alignment.centerLeft,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.title.value,
                        style: semiBold.copyWith(
                            fontSize: 24, color: Neutral.dark1),
                      ),
                      Text(
                        controller.artist.value,
                        style: regular.copyWith(
                            fontSize: 16, color: Neutral.dark3),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toggleLikeStatus();
                    },
                    child: SvgPicture.asset(
                      controller.isLiked.value
                          ? 'assets/icons/Union.svg'
                          : 'assets/icons/Heart.svg',
                      width: 18,
                    ),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 0.0),
                  thumbColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                  trackHeight: 3,
                ),
                child: Slider(
                  min: 0,
                  max: controller.duration.value.inSeconds.toDouble(),
                  value: controller.position.value.inSeconds.toDouble(),
                  onChanged: controller.handleSeek,
                  activeColor: Primary.mainColor,
                  inactiveColor: Neutral.dark4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.formatDuration(controller.position.value),
                    style: regular.copyWith(fontSize: 12, color: Neutral.dark3),
                  ),
                  Text(
                    controller.formatDuration(controller.duration.value),
                    style: regular.copyWith(fontSize: 12, color: Neutral.dark3),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/Shuffle Arrow.svg',
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    iconSize: 16,
                    alignment: Alignment.centerLeft,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/skip-previous.svg',
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 50,
                        ),
                        iconSize: 16,
                        alignment: Alignment.center,
                      ),
                      IconButton(
                        onPressed: controller.handlePlayPause,
                        icon: CircleAvatar(
                          backgroundColor: const Color(0xFFC7C9D9),
                          radius: 40,
                          child: Icon(
                            controller.player.playing
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 50,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/skip-next.svg',
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 50,
                        ),
                        iconSize: 16,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/pepicons-pop_repeat.svg',
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    iconSize: 16,
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
