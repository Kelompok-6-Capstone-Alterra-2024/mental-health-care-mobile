import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/mood_model.dart';

class AddMoodController extends GetxController {
  RxInt selectedMood = 1.obs;
  RxString note = ''.obs;
  RxString date = ''.obs;
  RxString filepath = ''.obs;

  void onNote(String value) {
    note.value = value;
  }
  
 RxList<Mood> moods = [
  Mood(moodId: 1, iconPath: 'assets/icons/Grin.svg', color: Color(0xffF8C6FF)),
  Mood(moodId: 2, iconPath: 'assets/icons/Smile.svg', color: Color(0xffcdfcbf)),
  Mood(moodId: 3, iconPath: 'assets/icons/Meh.svg', color: Color(0xffFBF198)),
  Mood(moodId: 4, iconPath: 'assets/icons/Sad.svg', color: Color(0xff9EE2FF)),
  Mood(moodId: 5, iconPath: 'assets/icons/depression.svg', color: Color(0xffffebe7)),
].obs;

  void selectMood(int mood) {
    selectedMood.value = mood;
  }

  void submitMood() {
    print('Mood: ${selectedMood.value}');
    print('Note: ${note.value}');
    print('Date: ${date.value}');
  }

  Future<String> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final path = result.files.first.name;
      return path;
    } else {
      return '';
    }
  }

  @override
  void onInit() {
    date.value = Get.arguments['date'];
    super.onInit();
  }
}
