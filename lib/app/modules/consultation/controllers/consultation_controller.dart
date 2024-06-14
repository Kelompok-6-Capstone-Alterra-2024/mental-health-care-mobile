import 'package:get/get.dart';

class ConsultationController extends GetxController {
  //TODO: Implement ConsultationController

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}

class ChipController extends GetxController {
  var selectedChipDate = (-1).obs;
  var selectedChipTime = (-1).obs;
  var selectedChipGender = (0).obs;

  void selectChipDate(int index) {
    selectedChipDate.value = index;
  }

  void selectChipTime(int index) {
    selectedChipTime.value = index;
  }

  void selectChipGender(int index) {
    selectedChipGender.value = index;
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