import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

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
