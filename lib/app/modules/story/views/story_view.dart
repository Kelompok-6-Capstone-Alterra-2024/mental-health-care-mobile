import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/story_controller.dart';

class StoryView extends GetView<StoryController> {
  const StoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
