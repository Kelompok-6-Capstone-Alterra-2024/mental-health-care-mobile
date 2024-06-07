import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../../constant/constant.dart';
import '../controllers/add_mood_controller.dart';

class AddMoodView extends GetView<AddMoodController> {
  const AddMoodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Pilih Mood Anda',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, Bagaimana hari anda?',
              style: semiBold.copyWith(fontSize: 24, color: Neutral.dark1),
            ),
            const Gap(10),
            Center(
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.moods.length,
                  itemBuilder: (context, index) {
                    final mood = controller.moods[index];
                    return GestureDetector(
                        onTap: () {
                          controller.selectMood(mood.moodId);
                        },
                        child: Obx(
                          () => Container(
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: controller.selectedMood.value == mood.moodId
                                  ? mood.color
                                  : Neutral.light2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SvgPicture.asset(
                              mood.iconPath,
                              width: 40,
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ),
            const Gap(20),
            Text(
              'Catatan hari ini',
              style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
            ),
            const Gap(10),
            TextFormField(
              onChanged: controller.onNote,
              decoration: primary.copyWith(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                hintText: 'Tambahkan catatan',
                hintStyle: regular.copyWith(fontSize: 16, color: Neutral.dark3),
              ),
            ),
            const Gap(20),
            Text(
              'Potret hari ini',
              style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                controller.pickFile();
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Neutral.dark5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/PhotoCamera.svg'),
                    Obx(() => Text(
                          controller.fileName.value,
                          style: regular.copyWith(
                              fontSize: 16, color: Neutral.dark3),
                        ))
                  ],
                ),
              ),
            ),
            const Gap(30),
            GestureDetector(
              onTap: () {
                controller.submitMood();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Primary.mainColor,
                  ),
                  child: Obx(() => controller.isLoading.value
                      ? const CupertinoActivityIndicator()
                      : Text(
                          'Simpan',
                          style: semiBold.copyWith(
                              fontSize: 16, color: Neutral.light4),
                          textAlign: TextAlign.center,
                        ))),
            )
          ],
        ),
      ),
    );
  }
}
