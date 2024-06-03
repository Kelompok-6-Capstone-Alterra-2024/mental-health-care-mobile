import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mindease/constant/constant.dart';
import 'package:mindease/utils/global_components/main_button.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/mood_track_controller.dart';

class MoodTrackView extends GetView<MoodTrackController> {
  const MoodTrackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pilih Tanggal',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: controller.goToPreviousMonth,
                ),
                Obx(() {
                  final monthName = DateFormat.MMMM().format(DateTime(
                      controller.currentYear, controller.currentMonth));
                  return Text(
                    '$monthName ${controller.currentYear}',
                    style: bold.copyWith(fontSize: 16),
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: controller.goToNextMonth,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: controller.daysOfWeek.map((day) {
                return Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: medium.copyWith(fontSize: 16),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Obx(() {
              final startOffset = controller.getStartOffset(
                  controller.currentYear, controller.currentMonth);
              final totalDays = controller.daysInMonth.length + startOffset;
              return Expanded(
                child: GetBuilder<MoodTrackController>(
                  id: 'calendar',
                  builder: (_) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              childAspectRatio: (4 / 5),
                              mainAxisSpacing: 4),
                      itemCount: totalDays,
                      itemBuilder: (context, index) {
                        if (index < startOffset) {
                          return Container(); // Empty container for offset
                        }
                        final day = controller.daysInMonth[index - startOffset];
                        final isSelected =
                            controller.selectedDate.isAtSameMomentAs(day);
                        return GestureDetector(
                          onTap: () {
                            controller.selectDate(day);
                            print(
                                'Selected date: ${DateFormat.yMMMd().format(day)}');
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Neutral.light2
                                  : Neutral.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Neutral.light2,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/flat.svg',
                                    width: 20,
                                  ),
                                ),
                                Text(
                                  day.day.toString(),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Neutral.dark3
                                        : Neutral.dark1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }),
            MainButtonWithoutPadding(
              label: 'Tambah',
              onTap: () {
                Get.toNamed(Routes.ADD_MOOD);
              },
            )
          ],
        ),
      ),
    );
  }
}
