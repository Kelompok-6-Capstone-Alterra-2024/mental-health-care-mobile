import 'package:get/get.dart';
import 'package:mindease/app/modules/consultation/mixins/detail_doctor_mixin.dart';
import '../data/models/doctor_model.dart';
import '../mixins/form_consultation_mixin.dart';

class ConsultationController extends GetxController with DetailDoctorMixin, FormConsultationMixin {
  
  RxList<Doctor> doctorsList = <Doctor>[].obs;
  RxInt selectedChipTime = (-1).obs;
  RxBool isSwitched = false.obs;

  final _selectedDate = DateTime.now().obs;
  final _daysInWeek = <DateTime>[].obs;
  DateTime get selectedDate => _selectedDate.value;
  List<DateTime> get daysInWeek => _daysInWeek;

  void selectChipTime(int index) {
    selectedChipTime.value = index;
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
    update(['date']);
  }

  @override
  void onInit() {
    updateDaysInWeek();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}


class SelecTabController extends GetxController {
  var selectedTabPayment = (1).obs;

  void selectTabPayment(int index) {
    selectedTabPayment.value = index;
  }
}

class SwitchController extends GetxController {
  RxBool isSwitched = false.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }
}
