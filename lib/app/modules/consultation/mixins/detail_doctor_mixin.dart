import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/modules/consultation/data/services/doctor_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';

mixin DetailDoctorMixin on GetxController {
  RxInt idDoctor = 0.obs;
  RxString nameDoctor = ''.obs;
  RxString specialistDoctor = ''.obs;
  RxString imageDoctor = ''.obs;
  RxInt feeDoctor = 0.obs;
  RxString educationDoctor = ''.obs;
  RxString experienceDoctor = ''.obs;
  RxString rateDoctor = ''.obs;
  RxString locationDoctor = ''.obs;
  RxInt consultationId = 0.obs;

  RxString paymentLink = ''.obs;

  void createSchedule(
      final int doctorId, final String date, final String time) async {
    try {
      final doctorServices = DoctorServices();
      await doctorServices.postSchedule(doctorId, date, time).then((value) {
        print('ini data id ${value.data.id}');
        consultationId.value = value.data.id;
        Get.offNamed(Routes.FORMCONSULTATION);
      });
    } catch (e) {
      print(e);
      Get.snackbar('Gagal', e.toString());
    }
  }

  int get totalFee => feeDoctor.value + 2000;

  //payment page
  void createPayment() async {
    final doctorServices = DoctorServices();
    print('ini consultation id ${consultationId.value}');
    print('ini total fee $totalFee');
    await doctorServices
        .postPayment(consultationId.value, totalFee)
        .then((value) {
      paymentLink.value = value.paymentLink;
    });
    await launchUrl(Uri.parse(paymentLink.value));
    Get.offAllNamed(Routes.NAVIGATION);
  }
}
