import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../components/music_card.dart';

class MusicTab extends StatelessWidget {
  const MusicTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.MUSIC);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Music",
              style: semiBold.copyWith(
                fontSize: 16,
                color: Primary.darker,
              ),
            ),
            const Gap(16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MusicCard(
                    image: 'assets/images/1.png',
                    title: 'Eternal Serenity',
                    artist: 'Luna Grace',
                    like: () {
                      // like function
                    },
                    onTap: () {
                      Get.toNamed(Routes.MUSIC);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
