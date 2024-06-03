import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/mood_model.dart';

class AddMoodController extends GetxController {
  //TODO: Implement AddMoodController

  RxString selectedMood = ''.obs;
  
 RxList<Mood> moods = [
  Mood(name: 'ceria', iconPath: 'assets/icons/Grin.svg', color: Color(0xffF8C6FF)),
  Mood(name: 'senyum', iconPath: 'assets/icons/Smile.svg', color: Color(0xffcdfcbf)),
  Mood(name: 'datar', iconPath: 'assets/icons/Meh.svg', color: Color(0xffFBF198)),
  Mood(name: 'sedih', iconPath: 'assets/icons/Sad.svg', color: Color(0xff9EE2FF)),
  Mood(name: 'depresi', iconPath: 'assets/icons/depression.svg', color: Color(0xffffebe7)),
].obs;

  void selectMood(String mood) {
    selectedMood.value = mood;
  }
}
