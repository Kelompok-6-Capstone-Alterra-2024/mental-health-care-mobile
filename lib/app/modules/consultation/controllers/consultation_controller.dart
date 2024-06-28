import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/consultation/data/services/doctor_services.dart';
import 'package:mindease/app/modules/consultation/mixins/detail_doctor_mixin.dart';
import '../data/models/doctor_model.dart';
import '../mixins/form_consultation_mixin.dart';

class ConsultationController extends GetxController
    with DetailDoctorMixin, FormConsultationMixin {
  RxList<Doctor> doctorsList = <Doctor>[].obs;
  RxInt selectedChipTime = (-1).obs;
  RxBool isSwitched = false.obs;

  final _selectedDate = DateTime.now().obs;
  final _daysInWeek = <DateTime>[].obs;
  final doctorServices = DoctorServices();
  DateTime get selectedDate => _selectedDate.value;
  List<DateTime> get daysInWeek => _daysInWeek;
  RxBool isLoadingMore = false.obs;
  RxBool hasMoreData = true.obs;
  int page = 1;
  int limit = 10;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    updateDaysInWeek();
    loadInitialDoctor();
    scrollController.addListener(onScroll);
    print('scrollController: $scrollController');
    super.onInit();
  }

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (maxScroll == currentScroll &&
        hasMoreData.value &&
        !isLoadingMore.value) {
      loadMoreDoctor();
    }
  }

  void loadInitialDoctor() async {
    try {
      final doctors =
          await DoctorServices().getAllDoctor(page: page, limit: limit);
      final sortedData = doctors.data;
      if (sortedData.length < limit) {
        hasMoreData.value = false;
      }
      doctorsList
          .addAll(sortedData); // Menggunakan addAll untuk menambahkan data baru
      page++;
    } catch (e) {
      print('Error: $e');
    }
  }

  void loadMoreDoctor() async {
    print('loadMoreDoctor');
    isLoadingMore.value = true;
    try {
      final doctors =
          await DoctorServices().getAllDoctor(page: page, limit: limit);
      List<Doctor> newSortedData = doctors.data;
      if (newSortedData.isEmpty || newSortedData.length < limit) {
        hasMoreData.value = false;
      }
      doctorsList.addAll(newSortedData);
      page++;
    } catch (e) {
      print('Error: $e');
    }
    isLoadingMore.value = false;
  }

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
