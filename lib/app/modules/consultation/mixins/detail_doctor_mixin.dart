import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mindease/app/modules/consultation/data/services/doctor_services.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void createSchedule(final int doctorId, final String date, final String time) async {
    final doctorServices = DoctorServices();
    await doctorServices.postSchedule(doctorId, date, time).then((value) {
      print('ini data id ${value.data.id}');
      consultationId.value = value.data.id;
    });
  }

  //payment page
  void createPayment() async {
    final doctorServices = DoctorServices();
    await doctorServices.postPayment(consultationId.value, feeDoctor.value).then((value) {
      paymentLink.value = value.paymentLink;
    });
    await launchUrl(Uri.parse(paymentLink.value));
  }
  
}