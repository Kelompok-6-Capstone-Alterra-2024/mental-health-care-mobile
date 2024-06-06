import 'package:get/get.dart';

mixin CalendarMixin on GetxController {
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
}
