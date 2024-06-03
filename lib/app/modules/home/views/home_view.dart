import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.logout();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Primary.mainColor,
          ),
          child: Text(
            'Logout',
            style: medium.copyWith(
              fontSize: 18,
              color: Neutral.dark1,
            ),
          ),
        ),
      ),
    );
  }
}
