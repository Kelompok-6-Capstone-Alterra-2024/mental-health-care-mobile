import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/app/modules/forum/detail_forum/views/components/post_card.dart';

import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/detail_forum_controller.dart';

class DetailForumView extends GetView<DetailForumController> {
  const DetailForumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TalkLife',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 22),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/my_forum_cover.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'TalkLife',
                    style:
                        semiBold.copyWith(fontSize: 24, color: Neutral.dark1),
                  ),
                ],
              ),
              const Gap(20),
              Text(
                textAlign: TextAlign.justify,
                'Forum yang membantu pengguna dari seluruh indonesia  berbagi pengalaman, mendukung satu sama lain, dan mengatasi tantangan kesehatan mental bersama',
                style: regular.copyWith(
                  fontSize: 12,
                  color: Neutral.dark2,
                ),
              ),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/member.svg',
                          width: 24,
                          height: 24,
                        ),
                        const Gap(6),
                        Text(
                          'Anggota',
                          style: medium.copyWith(
                              fontSize: 12, color: Neutral.dark3),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/share.svg',
                          width: 24,
                          height: 24,
                        ),
                        const Gap(6),
                        Text(
                          'Bagi',
                          style: medium.copyWith(
                              fontSize: 12, color: Neutral.dark3),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/quit.svg',
                          width: 24,
                          height: 24,
                        ),
                        const Gap(6),
                        Text(
                          'Keluar',
                          style: medium.copyWith(
                              fontSize: 12, color: Neutral.dark3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(40),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const PostCard();
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(6),
        height: 53,
        width: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Primary.mainColor,
        ),
        child: Row(
          children: [
            FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              elevation: 0,
              onPressed: () {
                Get.toNamed(Routes.POST_FORUM);
              },
              child: SvgPicture.asset('assets/icons/plus.svg'),
            ),
            const Gap(8),
            Text(
              'Post',
              style: medium.copyWith(fontSize: 16, color: Neutral.light4),
            ),
          ],
        ),
      ),
    );
  }
}
