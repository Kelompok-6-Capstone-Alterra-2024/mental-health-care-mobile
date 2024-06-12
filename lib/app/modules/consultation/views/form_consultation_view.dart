import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../controllers/consultation_controller.dart';
import '../../../../constant/constant.dart';

class FormConsultationView extends GetView<ConsultationController> {
  FormConsultationView({Key? key}) : super(key: key);
  final ChipController chipController = Get.put(ChipController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset('assets/icons/Back_Left.svg'),
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
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 63,
                      width: 63,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Avatar1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Andy Sp.KJ',
                          style: medium.copyWith(
                              fontSize: 16, color: Neutral.dark1),
                        ),
                        Text(
                          'Sp. Jiwa',
                          style: regular.copyWith(
                              fontSize: 12, color: Neutral.dark2),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Lengkapi formulir berikut : ',
                style:
                    semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
              ),
              const SizedBox(height: 12),
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
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
                  TextField(
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
                      hintText: 'Masukkan Riwayat kesehatan',
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainButton(
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
