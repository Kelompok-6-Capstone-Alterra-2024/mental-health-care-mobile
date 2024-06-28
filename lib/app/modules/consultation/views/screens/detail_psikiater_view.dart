import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../controllers/consultation_controller.dart';
import '../../../../../constant/constant.dart';
import '../components/doctor_specs.dart';

class DetailPsikiaterView extends GetView<ConsultationController> {
  const DetailPsikiaterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Daftar Psikiater',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 40,
          ),
          Flexible(
            child: Stack(
              children: [
                Container(
                  height: 356,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(controller.imageDoctor.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Neutral.light4,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  controller.nameDoctor.value,
                                  style: semiBold.copyWith(
                                      fontSize: 18, color: Neutral.dark1),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  controller.specialistDoctor.value,
                                  style: regular.copyWith(
                                      fontSize: 16, color: Neutral.dark2),
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                          const Gap(16),
                          DoctorSpecs(
                            expericence: controller.experienceDoctor.value,
                            rating: controller.rateDoctor.value,
                            cost: controller.feeDoctor.value,
                            university: controller.educationDoctor.value,
                            location: controller.locationDoctor.value,
                          ),
                          const Gap(16),
                          Text(
                            'Tanggal',
                            style: semiBold.copyWith(
                                fontSize: 16, color: Primary.mainColor),
                          ),
                          Gap(8),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: GetBuilder<ConsultationController>(
                                id: 'date',
                                builder: (context) {
                                  return ListView.builder(
                                    itemCount: 7,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final day = controller.daysInWeek[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.selectDate(day);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(right: 8),
                                          width: 90,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color:
                                                controller.selectedDate == day
                                                    ? Primary.mainColor
                                                    : Neutral.light1,
                                          ),
                                          child: Text(
                                            DateFormat('E dd').format(day),
                                            style: semiBold.copyWith(
                                                fontSize: 16,
                                                color:
                                                    controller.selectedDate ==
                                                            day
                                                        ? Neutral.light4
                                                        : Neutral.dark4),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                          ),
                          const Gap(8),
                          Text(
                            'Waktu',
                            style: semiBold.copyWith(
                                fontSize: 16, color: Primary.mainColor),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: Obx(
                              () {
                                int selectedTime =
                                    controller.selectedChipTime.value;
                                return ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.selectChipTime(index),
                                        child: Chip(
                                          label: Text(
                                            '${index + 12}:00',
                                            style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: selectedTime == index
                                                    ? Neutral.light4
                                                    : Neutral.dark4),
                                          ),
                                          backgroundColor: selectedTime == index
                                              ? Primary.mainColor
                                              : Neutral.light1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: const BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const Gap(16),
                          MainButtonWithoutPadding(
                            label: 'Buat Jadwal',
                            onTap: () {
                              controller.createSchedule(
                                controller.idDoctor.value,
                                DateFormat('yyyy-MM-dd')
                                    .format(controller.selectedDate),
                                '${controller.selectedChipTime.value + 12}:00',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
