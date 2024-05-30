import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../data/services/auth_service.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Token:',
              style: bold.copyWith(
                fontSize: 20,
                color: Neutral.dark1,
              ),
            ),
            const Gap(20),
            Text(
              '${AuthService.token}',
              style: medium.copyWith(
                fontSize: 18,
                color: Neutral.dark1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
