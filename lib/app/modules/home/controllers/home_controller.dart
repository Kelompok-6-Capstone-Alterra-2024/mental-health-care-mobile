import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxInt selectedMood = 0.obs;

  void selectMood(int index) {
    selectedMood.value = index;
    update(['mood']);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
