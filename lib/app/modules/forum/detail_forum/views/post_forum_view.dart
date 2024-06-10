import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/detail_forum_controller.dart';

class PostForumView extends GetView<DetailForumController> {
  const PostForumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostForumView'),
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
      body: const Center(
        child: Text(
          'PostForumView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
