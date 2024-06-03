import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/meditation_controller.dart';
import '../controllers/music_controller.dart';

class MusicView extends GetView<MusicController> {
  const MusicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MeditationController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron Left.svg',
            width: 24,
          ),
          constraints: const BoxConstraints(
            minWidth: 50,
          ),
          onPressed: () {
            Get.back();
          },
          padding: const EdgeInsets.only(
            left: 16,
          ),
          splashColor: Neutral.transparent,
          highlightColor: Neutral.transparent,
        ),
        title: Obx(
          () => Text(
            '${controller.tabNameTitle}',
            style: medium.copyWith(fontSize: 16, color: Primary.darker),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
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
              child: Image.asset(
                'assets/images/1.png',
                width: double.infinity,
                height: 317,
                fit: BoxFit.cover,
              ),
            ),
            // Gap(92),
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
                  constraints: BoxConstraints(
                    minWidth: 50,
                  ),
                  iconSize: 18,
                  alignment: Alignment.centerLeft,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Eternal Serenity',
                      style:
                          semiBold.copyWith(fontSize: 24, color: Neutral.dark1),
                    ),
                    Text(
                      'Luna Grace',
                      style:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Heart.svg',
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 50,
                  ),
                  iconSize: 18,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                thumbColor: Colors.transparent,
                overlayColor: Colors.transparent,
                trackHeight: 3,
              ),
              child: Slider(
                value: 0.5,
                onChanged: (value) {},
                activeColor: Primary.mainColor,
                inactiveColor: Neutral.dark4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0:00',
                  style: regular.copyWith(fontSize: 12, color: Neutral.dark3),
                ),
                Text(
                  '3:00',
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
                  constraints: BoxConstraints(
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
                      constraints: BoxConstraints(
                        minWidth: 50,
                      ),
                      iconSize: 16,
                      alignment: Alignment.center,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/play.svg',
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: 50,
                      ),
                      iconSize: 16,
                      alignment: Alignment.center,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/skip-next.svg',
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
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
                  constraints: BoxConstraints(
                    minWidth: 50,
                  ),
                  iconSize: 16,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
