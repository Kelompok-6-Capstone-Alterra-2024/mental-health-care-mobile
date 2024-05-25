import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArticleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ArticleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
