import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mindease/app/modules/home/mood_track/data/model/mood_model.dart';
import 'package:mindease/app/modules/home/mood_track/data/services/mood_service.dart';

import '../../../../routes/app_pages.dart';

class MoodTrackController extends GetxController {
  RxList<Mood> moods = <Mood>[].obs;
  RxString checkIcon = ''.obs;


  final _currentDate = DateTime.now().obs;
  final _currentYear = DateTime.now().year.obs;
  final _currentMonth = DateTime.now().month.obs;
  final _daysInMonth = <DateTime>[].obs;
  final _selectedDate = DateTime.now().obs;
  final List<String> daysOfWeek = [
    'Min',
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab'
  ];

  DateTime get currentDate => _currentDate.value;
  int get currentYear => _currentYear.value;
  int get currentMonth => _currentMonth.value;
  DateTime get selectedDate => _selectedDate.value;
  List<DateTime> get daysInMonth => _daysInMonth;

  void updateDaysInMonth() {
    _daysInMonth
        .assignAll(_getDaysInMonth(_currentYear.value, _currentMonth.value));
  }

  List<DateTime> _getDaysInMonth(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    return List.generate(
        lastDay.day, (index) => DateTime(year, month, index + 1));
  }

  int getStartOffset(int year, int month) {
    final firstDayOfMonth = DateTime(year, month, 1);
    return firstDayOfMonth.weekday % 7; // Adjust to make Sunday as 0
  }

  void goToPreviousMonth() {
    _currentMonth.value--;
    if (_currentMonth.value < 1) {
      _currentMonth.value = 12;
      _currentYear.value--;
    }
    updateDaysInMonth();
  }

  void goToNextMonth() {
    _currentMonth.value++;
    if (_currentMonth.value > 12) {
      _currentMonth.value = 1;
      _currentYear.value++;
    }
    updateDaysInMonth();
  }

  void selectDate(DateTime date) {
    _selectedDate.value = date;
    update(['calendar']);
  }

  void navigatedToAddMood() {
    Get.toNamed(Routes.ADD_MOOD,
        arguments: {'date': DateFormat('yyyy-MM-dd').format(selectedDate)});
  }

  // Future<void> getAllMood() async {
  //   final moodService = MoodService();
  //   await moodService.getMoodByDate(
  //     '2024-06-01',
  //     '2024-06-05',
  //   );
  // }

  void loadMoods() async {
    // final startDate = DateFormat('yyyy-MM-dd').format(DateTime(currentYear, currentMonth, 1));
    // final endDate = DateFormat('yyyy-MM-dd').format(DateTime(currentYear, currentMonth + 1, 0));
    try {
      final moodModel = await MoodService().getMoodByDate('2024-06-01',
      '2024-06-05');
      moods.assignAll(moodModel.data);
      update(['calendar']);
    } catch (e) {
      print(e);
    }
  }

  // bool hasMoodForDate(DateTime date) {
  //   return moods.any((mood) => mood.date.isAtSameMomentAs(date));
  // }

  String getMoodForDate(DateTime date) {
    Mood? mood = moods.firstWhereOrNull((mood) => mood.date.isAtSameMomentAs(date));
    return mood?.moodType.id.toString() ?? '';
  }






//   String getMoodForDate(DateTime date) {
//     Mood? mood = moods.firstWhereOrNull((mood) => mood.date.isSameDate(date));
//     return mood?.moodType.name ?? '';
//   }

//   bool isSameDate(DateTime date1, DateTime date2) {
//   return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
// }

  @override
  void onInit() {
    updateDaysInMonth();
    loadMoods();
    super.onInit();
  }
}
