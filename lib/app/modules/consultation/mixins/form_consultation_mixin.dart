import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/modules/consultation/data/services/doctor_services.dart';

import '../../../routes/app_pages.dart';

mixin FormConsultationMixin on GetxController {
  RxString name = ''.obs;
  RxString age = ''.obs;
  RxBool gender = false.obs;
  RxString message = ''.obs;
  RxString medicalHistory = ''.obs;
  RxInt consultationID = 0.obs;
  RxBool isLoading = false.obs;

  void setName(String value) {
    name.value = value;
  }

  void setGender(bool value) {
    gender.value = value;
  }

  void setAge(String value) {
    age.value = value;
  }

  void setMessage(String value) {
    message.value = value;
  }

  void setMedicalHistory(String value) {
    medicalHistory.value = value;
  }

  Future<void> createComplaint(int consultationId) async {
    // print('Consultation ID: $consultationId');
    // print('Name: ${name.value}');
    // print('Old: ${age.value}');
    // print('message ${message.value}');
    // print('Medical History: ${medicalHistory.value}');
    // isLoading.value = false;
    try {
      final response = await DoctorServices().postComplaint(
          consultationId,
          name.value,
          int.parse(age.value),
          gender.value == true ? 'wanita' : 'pria',
          message.value,
          medicalHistory.value);
      if (response.statusCode == 201) {
        Get.toNamed(Routes.PAYMENT);
        Logger().i(response.data);
        return response.data;
      } else {
        Logger().e(response.data);
        Get.snackbar('Gagal', 'Gagal membuat keluhan');
      }
    } catch (e) {
      Logger().e(e.toString());
      Get.snackbar('Gagal', e.toString());
    }
    // isLoading.value = false;
    // print('Consultation ID: $consultationId');
    // print('Name: ${name.value}');
    // print('Old: ${age.value}');
    // print(gender.value == true ? 'wanita' : 'laki-laki');
    // print('Message: ${message.value}');
    // print('Medical History: ${medicalHistory.value}');
  }
}
