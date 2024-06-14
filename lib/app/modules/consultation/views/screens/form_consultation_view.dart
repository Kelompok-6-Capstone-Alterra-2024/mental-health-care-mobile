import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';
import '../../controllers/consultation_controller.dart';
import '../../../../../constant/constant.dart';
import '../components/profile_form_doctor.dart';

class FormConsultationView extends GetView<ConsultationController> {
  FormConsultationView({Key? key}) : super(key: key);
  final ChipController chipController = Get.put(ChipController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Form Konsultasi',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              const ProfileFormDoctor(
                name: 'Dr. Stella Kane',
                specialist: 'Psikiater',
              ),
              const SizedBox(height: 16),
              Text(
                'Lengkapi formulir berikut : ',
                style:
                    semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Pasien',
                    style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: primary.copyWith(
                      hintText: 'Masukkan nama',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Usia',
                    style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: primary.copyWith(
                      hintText: 'Masukkan usia',
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis Kelamin',
                    style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => chipController.selectChipGender(1),
                            child: Chip(
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              label: Text(
                                'Laki - Laki',
                                style: semiBold.copyWith(
                                    fontSize: 16,
                                    color: chipController
                                                .selectedChipGender.value ==
                                            1
                                        ? Neutral.light4
                                        : Neutral.dark4),
                              ),
                              backgroundColor:
                                  chipController.selectedChipGender.value == 1
                                      ? Primary.mainColor
                                      : Neutral.light1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => chipController.selectChipGender(2),
                            child: Chip(
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              label: Text(
                                'Perempuan',
                                style: semiBold.copyWith(
                                    fontSize: 16,
                                    color: chipController
                                                .selectedChipGender.value ==
                                            2
                                        ? Neutral.light4
                                        : Neutral.dark4),
                              ),
                              backgroundColor:
                                  chipController.selectedChipGender.value == 2
                                      ? Primary.mainColor
                                      : Neutral.light1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pesan',
                    style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    maxLines: 4,
                    decoration: textBoxStyle.copyWith(
                      hintText: 'Masukan pesan untuk konsultasi',
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Riwayat Kesehatan',
                    style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: primary.copyWith(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      hintText: 'Masukkan Riwayat kesehatan',
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                    ),
                  ),
                ],
              ),
              const Gap(16),
              MainButtonWithoutPadding(
                label: 'Kirim Formulir',
                onTap: () {
                  Get.toNamed(Routes.PAYMENT);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
