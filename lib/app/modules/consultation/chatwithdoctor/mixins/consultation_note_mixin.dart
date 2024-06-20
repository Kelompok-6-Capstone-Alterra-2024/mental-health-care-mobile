import 'package:get/state_manager.dart';

import '../data/services/consultation_note_service.dart';

mixin ConsultationNoteMixin on GetxController {
  RxString doctorName = ''.obs;
  RxString doctorSpecialist = ''.obs;
  RxString musicImgUrl = ''.obs;
  RxString musicTitle = ''.obs;
  RxString forumName = ''.obs;
  RxString forumImgUrl = ''.obs;
  RxString firstPoint = ''.obs;
  RxString secondPoint = ''.obs;
  RxString thirdPoint = ''.obs;
  RxString moodTrack = ''.obs;

  final consultationNoteService = ConsultationNoteService();

  Future<void> getConsultationNoteData(int chatRoomId) async {
    await consultationNoteService
        .getConsultationNote(
      chatRoomId,
    )
        .then(
      (value) {
        doctorName.value = value.data.doctor.name;
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
}
