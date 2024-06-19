import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/home/mood_track/controllers/mood_track_controller.dart';
import 'package:mindease/app/modules/home/mood_track/data/services/mood_service.dart';

import '../../../../../routes/app_pages.dart';
import '../data/model/mood_model.dart';

class AddMoodController extends GetxController {
  RxInt selectedMood = 1.obs;
  RxString note = ''.obs;
  RxString date = ''.obs;
  Rx<File?> filepath = Rx<File?>(null);
  RxString fileName = 'Tambahkan Foto'.obs;
  RxBool isLoading = false.obs;

  void onNote(String value) {
    note.value = value;
  }
  
 RxList<MoodData> moods = [
  MoodData(moodId: 1, iconPath: 'assets/icons/Grin.svg', color: Color(0xffF8C6FF)),
  MoodData(moodId: 2, iconPath: 'assets/icons/Smile.svg', color: Color(0xffcdfcbf)),
  MoodData(moodId: 3, iconPath: 'assets/icons/Meh.svg', color: Color(0xffFBF198)),
  MoodData(moodId: 4, iconPath: 'assets/icons/Sad.svg', color: Color(0xff9EE2FF)),
  MoodData(moodId: 5, iconPath: 'assets/icons/depression.svg', color: Color(0xffffebe7)),
].obs;

  void selectMood(int mood) {
    selectedMood.value = mood;
  }

  Future<void> submitMood() async {
    isLoading.value = true;
    final moodService = MoodService();
    await moodService.addMood(
      moodId: selectedMood.value,
      note: note.value,
      date: date.value,
      file: filepath.value,
    );
    // Get.put(MoodTrackController().loadMoods());
    isLoading.value = false;
    // Get.back();
    Get.offAllNamed(Routes.NAVIGATION);
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      filepath.value = File(result.files.single.path!);
      fileName.value = result.files.first.name;
    } 
  }

  @override
  void onInit() {
    date.value = Get.arguments['date'];
    super.onInit();
  }

}
