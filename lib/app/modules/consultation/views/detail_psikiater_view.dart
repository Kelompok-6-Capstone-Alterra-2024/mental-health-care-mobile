import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../controllers/consultation_controller.dart';
import '../../../../constant/constant.dart';

class DetailPsikiaterView extends GetView<ConsultationController> {
  DetailPsikiaterView({Key? key}) : super(key: key);
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
          'Daftar Psikiater',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 40,
          ),
          Flexible(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  color: Colors.white,
                ),
                Container(
                  height: 356,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/photo1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Neutral.light4,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    height: 557,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Andy Sp.KJ',
                                style: semiBold.copyWith(
                                    fontSize: 18, color: Neutral.dark1),
                              ),
                              Text(
                                'Sp. Jiwa',
                                style: regular.copyWith(
                                    fontSize: 16, color: Neutral.dark2),
                              ),
                              Divider(),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '14 Tahun',
                                    style: semiBold.copyWith(
                                        fontSize: 16, color: Primary.mainColor),
                                  ),
                                  Text(
                                    'Pengalaman',
                                    style: medium.copyWith(
                                        fontSize: 12, color: Neutral.dark3),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '95%',
                                    style: semiBold.copyWith(
                                        fontSize: 16, color: Primary.mainColor),
                                  ),
                                  Text(
                                    'Rating',
                                    style: medium.copyWith(
                                        fontSize: 12, color: Neutral.dark3),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rp. 150.000',
                                    style: semiBold.copyWith(
                                        fontSize: 16, color: Primary.mainColor),
                                  ),
                                  Text(
                                    'Biaya',
                                    style: medium.copyWith(
                                        fontSize: 12, color: Neutral.dark3),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Tentang Psikiater',
                            style: semiBold.copyWith(
                                fontSize: 16, color: Primary.mainColor),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                    color: Primary.mainColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: SvgPicture.asset(
                                      'assets/icons/Mortarboard_light.svg'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Universitas Nusantara, 1990',
                                    style: medium.copyWith(
                                        fontSize: 16, color: Neutral.dark2),
                                  ),
                                  Text(
                                    "Alumnus",
                                    style: regular.copyWith(
                                        fontSize: 12, color: Neutral.dark2),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                    color: Primary.mainColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: SvgPicture.asset(
                                      'assets/icons/Location-Point.svg'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Klinik Citra Bina Husada, Bandung',
                                    style: medium.copyWith(
                                        fontSize: 16, color: Neutral.dark2),
                                  ),
                                  Text(
                                    "Lokasi Praktik",
                                    style: regular.copyWith(
                                        fontSize: 12, color: Neutral.dark2),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tanggal',
                            style: semiBold.copyWith(
                                fontSize: 16, color: Primary.mainColor),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: Obx(
                              () {
                                int selectedDate =
                                    chipController.selectedChipDate.value;
                                return ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () => chipController
                                            .selectChipDate(index),
                                        child: Chip(
                                          label: Text(
                                            'Sen 12',
                                            style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: selectedDate == index
                                                    ? Neutral.light4
                                                    : Neutral.dark4),
                                          ),
                                          backgroundColor: selectedDate == index
                                              ? Primary.mainColor
                                              : Neutral.light1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: const BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Text(
                            'Waktu',
                            style: semiBold.copyWith(
                                fontSize: 16, color: Primary.mainColor),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: Obx(
                              () {
                                int selectedTime =
                                    chipController.selectedChipTime.value;
                                return ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () => chipController
                                            .selectChipTime(index),
                                        child: Chip(
                                          label: Text(
                                            '14:00',
                                            style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: selectedTime == index
                                                    ? Neutral.light4
                                                    : Neutral.dark4),
                                          ),
                                          backgroundColor: selectedTime == index
                                              ? Primary.mainColor
                                              : Neutral.light1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: const BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          MainButton(
                            label: 'Buat Jadwal',
                            onTap: () {
                              Get.toNamed(Routes.FORMCONSULTATION);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
