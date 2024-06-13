import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comment_forum_controller.dart';

class CommentForumView extends GetView<CommentForumController> {
  const CommentForumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommentForumView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CommentForumView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
