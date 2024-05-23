import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/global_components/main_button.dart';
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
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Home View'),
            MainButton(
              label: 'Go to Detail',
              onTap: () {},
            ),
            Gap(16),
            TextFormField(
              decoration: primary.copyWith(
                hintText: 'Email',
              ),
            )
          ],
        ),
      ),
    );
  }
}
