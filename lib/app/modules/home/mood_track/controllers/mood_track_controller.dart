import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mindease/app/modules/home/mood_track/data/model/mood_model.dart';
import 'package:mindease/app/modules/home/mood_track/data/services/mood_service.dart';

import '../../../../routes/app_pages.dart';
import '../data/model/mood_details_model.dart';
import '../mixin/calendar_mixin.dart';

class MoodTrackController extends GetxController  with CalendarMixin {
  RxList<Mood> moods = <Mood>[].obs;
  RxString checkIcon = ''.obs;
  RxInt moodId = 0.obs;
  RxList<DataMood> moodData = <DataMood>[].obs;

 
  void navigatedToAddMood() {
    Get.toNamed(Routes.ADD_MOOD,
        arguments: {'date': DateFormat('yyyy-MM-dd').format(selectedDate)});
  }


  void loadMoods() async {
    // final startDate = DateFormat('yyyy-MM-dd').format(DateTime(currentYear, currentMonth, 1));
    // final endDate = DateFormat('yyyy-MM-dd').format(DateTime(currentYear, currentMonth + 1, 0));
    try {
      final moodModel =
          await MoodService().getMoodByDate('2024-06-01', '2024-06-05');
      moods.assignAll(moodModel.data);
      update(['calendar']);
    } catch (e) {
      print(e);
    }
  }

  String getMoodForDate(DateTime date) { // check same date from response data
    Mood? mood =
        moods.firstWhereOrNull((mood) => mood.date.isAtSameMomentAs(date));
    return mood?.moodType.id.toString() ?? '';
  }

  String fetchMoodId(DateTime date) {
    Mood? mood =
        moods.firstWhereOrNull((mood) => mood.date.isAtSameMomentAs(date));
    return mood?.id.toString() ?? '';
  }

  bool moodExistsForDate(DateTime date) {
    return moods.any((mood) => mood.date.isAtSameMomentAs(date));
  }


  @override
  void onInit() {
    updateDaysInMonth();
    loadMoods();
    super.onInit();
  }
}
