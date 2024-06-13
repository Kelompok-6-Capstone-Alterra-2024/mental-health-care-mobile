import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/mixins/change_password_mixin.dart';

class ProfileController extends GetxController with ChangePasswordMixin {
  //TODO: Implement ProfileController

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
