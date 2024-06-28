import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../../routes/app_pages.dart';
import '../data/services/consultation_note_service.dart';
import '../data/services/feedback_services.dart';

mixin ConsultationNoteMixin on GetxController {
  RxInt doctorId = 0.obs;
  RxString doctorName = ''.obs;
  RxString doctorImgUrl = ''.obs;
  RxString doctorSpecialist = ''.obs;
  RxString musicImgUrl = ''.obs;
  RxString musicTitle = ''.obs;
  RxString forumName = ''.obs;
  RxString forumImgUrl = ''.obs;
  RxString firstPoint = ''.obs;
  RxString secondPoint = ''.obs;
  RxString thirdPoint = ''.obs;
  RxString moodTrack = ''.obs;

  RxInt rate = 1.obs;
  RxString message = ''.obs;

  final consultationNoteService = ConsultationNoteService();

  Future<void> getConsultationNoteData(int chatRoomId) async {
    await consultationNoteService
        .getConsultationNote(
      chatRoomId,
    )
        .then(
      (value) {
        doctorName.value = value.data.doctor.name;
        doctorImgUrl.value = value.data.doctor.imageUrl;
        doctorSpecialist.value = value.data.doctor.specialist;
        musicImgUrl.value = value.data.music.imageUrl;
        musicTitle.value = value.data.music.title;
        forumName.value = value.data.forum.name;
        forumImgUrl.value = value.data.forum.imageUrl;
        firstPoint.value = value.data.mainPoint;
        secondPoint.value = value.data.nextStep;
        thirdPoint.value = value.data.additionalNote;
        moodTrack.value = value.data.moodTrackerNote;
      },
    );
  }

  void setRate(int value) {
    rate.value = value;
  }

  void setMessage(String value) {
    message.value = value;
  }

  Future<void> createFeedback(int rate, String message) async {
    debugPrint('Doctor ID: ${doctorId.value}');
    debugPrint('Rate: $rate');
    debugPrint('Message: $message');
    final feedbackServices = FeedbackServices();
    try {
      await feedbackServices.postFeedback(
        doctorId.value,
        rate,
        message,
      );
      Get.offAllNamed(Routes.NAVIGATION);
    } catch (e) {
      Get.snackbar('Gagal', e.toString());
    }
  }
}
