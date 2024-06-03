import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/constant/constant.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.selectedPageIndex.call,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Get.height * 0.66,
                        decoration: const BoxDecoration(
                          color: Primary.subtle,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(120),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Primary.subtle,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(120),
                          ),
                        ),
                        child: Image.asset(
                          controller.items[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  const Gap(50),
                  Text(
                    controller.items[index].title,
                    style:
                        semiBold.copyWith(fontSize: 24, color: Neutral.dark1),
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      controller.items[index].descriptions,
                      style:
                          regular.copyWith(fontSize: 14, color: Neutral.dark3),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Gap(100),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.items.length,
                      (index) => Obx(() {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color: controller.selectedPageIndex.value == index
                                ? Primary.mainColor
                                : Neutral.dark4,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      controller.forwardAction();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Primary.mainColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lanjut",
                            style: semiBold.copyWith(
                                fontSize: 16, color: Neutral.light4),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(8),
                          SvgPicture.asset(
                            "assets/icons/arrow.svg",
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
