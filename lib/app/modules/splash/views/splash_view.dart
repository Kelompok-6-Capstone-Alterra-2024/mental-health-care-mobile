import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 74),
        child: Center(child: Image.asset('assets/images/splash.png')),
      ),
    );
  }
}
