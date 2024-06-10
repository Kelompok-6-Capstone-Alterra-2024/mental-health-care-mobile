import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../controllers/detail_forum_controller.dart';

class DetailForumView extends GetView<DetailForumController> {
  const DetailForumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailForumView'),
        centerTitle: true,
      ),
      body: Center(
          child: MainButton(
              label: 'Post Forum',
              onTap: () {
                Get.offNamed(Routes.POST_FORUM);
              })),
    );
  }
}
