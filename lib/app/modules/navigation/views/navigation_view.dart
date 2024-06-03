import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mindease/constant/constant.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          // ignore: prefer_const_constructors
          shape: CircleBorder(),
          onPressed: () {},
          backgroundColor: Primary.mainColor,
          child: SvgPicture.asset('assets/icons/Stethoscope.svg'),
        ),
      ),
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          child: BottomAppBar(
            surfaceTintColor: Neutral.transparent,
            shadowColor: Neutral.transparent,
            height: 80,
            color: Neutral.light1,
            elevation: 0,
            shape: const CircularNotchedRectangle(),
            notchMargin: 4,
            clipBehavior: Clip.antiAlias,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Primary.mainColor,
                unselectedItemColor: Neutral.dark3,
                elevation: 0,
                enableFeedback: false,
                backgroundColor: Neutral.transparent,
                selectedLabelStyle: regular.copyWith(fontSize: 12),
                unselectedLabelStyle: regular.copyWith(fontSize: 12),
                items: [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/home_active.svg',
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/home_inactive.svg',
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/community_active.svg',
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/community_inactive.svg',
                    ),
                    label: 'Chat',
                  ),
                  const BottomNavigationBarItem(
                    icon: SizedBox(),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/meditation_active.svg',
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/meditation_inactive.svg',
                    ),
                    label: 'Calendar',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/profile_active.svg',
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/profile_inactive.svg',
                    ),
                    label: 'Profile',
                  ),
                ],
                
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}
