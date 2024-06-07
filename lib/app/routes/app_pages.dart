import 'package:get/get.dart';
import 'package:mindease/app/modules/consultation/views/detail_psikiater_view.dart';
import 'package:mindease/app/modules/consultation/views/form_consultation_view.dart';
import 'package:mindease/app/modules/consultation/views/payment_view.dart';

import '../modules/consultation/bindings/consultation_binding.dart';
import '../modules/consultation/views/consultation_view.dart';
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
  ];
}
