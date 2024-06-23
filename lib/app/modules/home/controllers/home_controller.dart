import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mindease/app/modules/home/data/model/allmusic_model.dart';

import '../../navigation/controllers/navigation_controller.dart';
import '../data/services/profile_services.dart';
import '../mood_track/data/model/mood_model.dart';
import '../mood_track/data/services/mood_service.dart';

class HomeController extends GetxController {
  final _currentDate = DateTime.now().obs;
  final _selectedDate = DateTime.now().obs;
  final _selectedMood = 0.obs; // Tambahkan mood yang dipilih
  final _daysInWeek = <DateTime>[].obs;
  RxList<Mood> moods = <Mood>[].obs; // Menyimpan data mood
  RxList<DataMusic> allMusic = <DataMusic>[].obs;

  DateTime get currentDate => _currentDate.value;
  DateTime get selectedDate => _selectedDate.value;
  int get selectedMood =>
      _selectedMood.value; // Tambahkan getter untuk mood yang dipilih
  List<DateTime> get daysInWeek => _daysInWeek;

  RxString name = ''.obs;

  Future<void> getProfile() async {
    await ProfileServices().getProfile().then((profile) {
      name.value = profile.data.username;
    });
  }

  @override
  void onInit() {
    getProfile();
    updateDaysInWeek();
    loadMoods();
    super.onInit();
  }

  void updateDaysInWeek() {
    final now = _selectedDate.value;
    final startOfWeek = now.subtract(
        Duration(days: now.weekday - 1)); // Assuming week starts on Monday
    _daysInWeek.assignAll(
        List.generate(7, (index) => startOfWeek.add(Duration(days: index))));
  }

  void selectDate(DateTime date) {
    _selectedDate.value = date;
    print(date);
    update(['mood']);
  }

  void selectMood(int index) {
    // Tambahkan fungsi untuk memilih mood
    _selectedMood.value = index;
    update(['mood']);
  }

  Future<void> loadMoods() async {
    final startDate = DateFormat('yyyy-MM-dd').format(_daysInWeek.first);
    final endDate = DateFormat('yyyy-MM-dd').format(_daysInWeek.last);
    try {
      final moodModel = await MoodService().getMoodByDate(startDate, endDate);
      moods.assignAll(moodModel.data);
      update(['mood']);
    } catch (e) {
      print(e);
    }
  }

  String getMoodForDate(DateTime date) {
    Mood? mood = moods.firstWhereOrNull((mood) => isSameDate(mood.date, date));
    return mood?.moodType.id.toString() ?? '';
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void changeIndex(int index) {
    final navigationController = Get.put(NavigationController());
    navigationController.changeIndex(index);
  }
}
