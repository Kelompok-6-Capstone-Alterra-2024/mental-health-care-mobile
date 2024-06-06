import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mindease/app/modules/home/mood_track/data/model/mood_details_model.dart';
import 'package:mindease/app/modules/home/mood_track/data/services/mood_service.dart';
import 'package:mindease/constant/constant.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../utils/helper/calendar_icon.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                return GetBuilder<MoodTrackController>(
                  id: 'calendar',
                  builder: (_) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: (4 / 5),
                        mainAxisSpacing: 4,
                      ),
                      itemCount: totalDays,
                      itemBuilder: (context, index) {
                        if (index < startOffset) {
                          return Container(); // Empty container for offset
                        }
                        final day = controller.daysInMonth[index - startOffset];
                        final isSelected =
                            controller.selectedDate.isAtSameMomentAs(day);
                        final mood = controller.getMoodForDate(day);
                        final moodID = controller.fetchMoodId(day);
                        return GestureDetector(
                          onTap: () {
                            controller.selectDate(day);
                            moodID != ''
                                ? controller.moodId.value = int.parse(moodID)
                                : controller.moodId.value = 0;
                            print(controller.moodId.value);
                            print(
                                'Selected date: ${DateFormat.yMMMd().format(day)}');
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? moodStatusColor(mood)
                                  : Neutral.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: moodStatusColor(mood),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: moodStatusIcon(mood),
                                ),
                                Text(
                                  day.day.toString(),
                                  style: semiBold.copyWith(
                                    fontSize: 12,
                                    color: Neutral.dark1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }),
              const Gap(20),
              Obx(() => controller.moodExistsForDate(controller.selectedDate)
                ? FutureBuilder<MoodDetailsModel>(
                  future: MoodService().getMoodDetail(controller.moodId.value),
                  builder: (BuildContext context, AsyncSnapshot<MoodDetailsModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else {
                        final moodDetails = snapshot.data!.data;
                        
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Neutral.light3,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [blur4, blur8]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: moodStatusColor(moodDetails.moodType.id.toString()),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: moodStatusIcon(moodDetails.moodType.id.toString()),
                                  ),
                                  const Gap(5),
                                  Text(
                                    DateFormat.MMMd().format(DateTime.parse(moodDetails.date)),
                                    style: semiBold.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Text(
                                moodDetails.message,
                                style: medium.copyWith(fontSize: 12),
                              ),
                              const Gap(10),
                              moodDetails.imageUrl != ''
                                  ? Image.network(
                                      moodDetails.imageUrl,
                                      width: 80,
                                      height: 80,
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        );
                      }
                    }
                  })
                  : const SizedBox(),
              ),
              const Gap(10),
              Obx(() => controller.moodExistsForDate(controller.selectedDate)
                  ? const SizedBox()
                  : MainButtonWithoutPadding(
                      label: 'Tambah',
                      onTap: () {
                        controller.navigatedToAddMood();
                      },
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
