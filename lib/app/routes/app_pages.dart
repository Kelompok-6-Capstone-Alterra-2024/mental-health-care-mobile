import 'package:get/get.dart';

import '../modules/chatwithdoctor/bindings/chatwithdoctor_binding.dart';
import '../modules/chatwithdoctor/views/chat_list_view.dart';
import '../modules/chatwithdoctor/views/chatwithdoctor_view.dart';
import '../modules/chatwithdoctor/views/detail_consultation_note_view.dart';
import '../modules/chatwithdoctor/views/rating_doctor_view.dart';
import '../modules/consultation/bindings/consultation_binding.dart';
import '../modules/consultation/views/consultation_view.dart';
import '../modules/consultation/views/detail_psikiater_view.dart';
import '../modules/consultation/views/form_consultation_view.dart';
import '../modules/consultation/views/payment_view.dart';
import '../modules/consultation/views/paymentdeclined_view.dart';
import '../modules/consultation/views/paymentprocessed_view.dart';
import '../modules/consultation/views/paymentsuccess_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION,
      page: () => const ConsultationView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPSIKIATER,
      page: () => DetailPsikiaterView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.FORMCONSULTATION,
      page: () => FormConsultationView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTSUCCESS,
      page: () => PaymentsuccessView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTDECLINED,
      page: () => PaymentdeclinedView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTPROCESSED,
      page: () => PaymentprocessedView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.CHATWITHDOCTOR,
      page: () => const ChatwithdoctorView(),
      binding: ChatwithdoctorBinding(),
    ),
    GetPage(
      name: _Paths.DETAILNOTE,
      page: () => const DetailConsultationNoteView(),
      binding: ChatwithdoctorBinding(),
    ),
    GetPage(
      name: _Paths.RATINGDOCTOR,
      page: () => const RatingDoctorView(),
      binding: ChatwithdoctorBinding(),
    ),
    GetPage(
      name: _Paths.CHATLIST,
      page: () => const ChatListView(),
      binding: ChatwithdoctorBinding(),
    ),
  ];
}
