
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

mixin ChangePasswordMixin on GetxController {
  RxBool isVisible = true.obs;
  RxBool isVisibleOldPassword = true.obs;
}