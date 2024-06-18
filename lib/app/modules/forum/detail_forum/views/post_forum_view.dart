import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../controllers/detail_forum_controller.dart';

class PostForumView extends GetView<DetailForumController> {
  const PostForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posting Diskusi',
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: () {
                controller.postForum();
              },
              child: Container(
                alignment: Alignment.center,
                height: 27,
                width: 79,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Primary.mainColor,
                ),
                child: Text(
                  'Posting',
                  style: medium.copyWith(fontSize: 12, color: Neutral.light4),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            TextField(
              onChanged: controller.onNote,
              decoration: const InputDecoration(
                hintText: 'Apa yang ingin anda bicarakan?',
                border: InputBorder.none,
              ),
            ),
            const Gap(5),
            GestureDetector(
              onTap: () {
                controller.pickFile();
              },
              child: SvgPicture.asset(
                'assets/icons/upload_photo.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
