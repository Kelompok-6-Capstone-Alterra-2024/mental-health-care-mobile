// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mindease/app/modules/consultation/data/models/doctor_model.dart';
import 'package:mindease/app/modules/consultation/data/services/doctor_services.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/consultation_controller.dart';
import '../../../../constant/constant.dart';
import 'components/doctor_card.dart';
import 'components/loading_screen.dart';

class ConsultationView extends GetView<ConsultationController> {
  const ConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Psikiater',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.CHATLIST);
            },
            icon: SvgPicture.asset('assets/icons/History.svg'),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TextField(
                    decoration: primary.copyWith(
                      hintText: 'Temukan meditasimu disini',
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: SvgPicture.asset(
                            'assets/icons/Search.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            Obx(() {
              if (controller.isLoadingMore.value) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (controller.doctorsList.isEmpty) {
                return SliverToBoxAdapter(
                  child: Skeletonizer(
                    ignoreContainers: false,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                            image:
                                'https://wallpapers.com/images/hd/doctor-pictures-l5y1qs2998u7rf0x.jpg',
                            name: 'name',
                            title: 'title',
                            yearsofservice: ' years',
                            rating: 'rating',
                            price: 1000);
                      },
                    ),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index < controller.doctorsList.length) {
                        final doctor = controller.doctorsList[index];
                        return DoctorCard(
                          image: doctor.profilePicture == 'http://gambar.com' ||
                                  doctor.profilePicture == 'ini link fotonya'
                              ? 'https://wallpapers.com/images/hd/doctor-pictures-l5y1qs2998u7rf0x.jpg'
                              : doctor.profilePicture,
                          name: doctor.name,
                          title: doctor.specialist,
                          yearsofservice: doctor.experience.toString(),
                          rating: '${doctor.ratingPrecentage}%',
                          price: doctor.fee,
                          like: () {},
                          onTapCard: () {
                            Get.toNamed(
                              Routes.DETAILPSIKIATER,
                            );
                            controller.idDoctor.value = doctor.id;
                            controller.nameDoctor.value = doctor.name;
                            controller.specialistDoctor.value =
                                doctor.specialist;
                            controller.experienceDoctor.value =
                                doctor.experience.toString();
                            controller.feeDoctor.value = doctor.fee;
                            controller.imageDoctor.value = doctor
                                            .profilePicture ==
                                        'http://gambar.com' ||
                                    doctor.profilePicture == 'ini link fotonya'
                                ? 'https://wallpapers.com/images/hd/doctor-pictures-l5y1qs2998u7rf0x.jpg'
                                : doctor.profilePicture;
                            controller.rateDoctor.value =
                                '${doctor.ratingPrecentage}%';
                            controller.locationDoctor.value = doctor.address;
                            controller.educationDoctor.value =
                                doctor.masterAlmamater;
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    childCount: controller.hasMoreData.value
                        ? controller.doctorsList.length + 1
                        : controller.doctorsList.length,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
