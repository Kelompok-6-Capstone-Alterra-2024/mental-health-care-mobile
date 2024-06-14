import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../../controllers/consultation_controller.dart';
import '../../../../../constant/constant.dart';

class PaymentView extends GetView<ConsultationController> {
  PaymentView({Key? key}) : super(key: key);
  final SwitchController switchController = Get.put(SwitchController());
  final SelecTabController selecTabController = Get.put(SelecTabController());

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
          'Detail Pembayaran',
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
                              const Divider(),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Biaya Sesi Konsultasi',
                                    style: medium.copyWith(
                                        fontSize: 14, color: Neutral.dark3),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        'Biaya Layanan',
                                        style: medium.copyWith(
                                            fontSize: 14, color: Neutral.dark3),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 14,
                                        width: 14,
                                        child: SvgPicture.asset(
                                            'assets/icons/Warning.svg'),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Pembayaranmu',
                                    style: bold.copyWith(
                                        fontSize: 14, color: Neutral.dark3),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Rp. 150.000',
                                    style: bold.copyWith(
                                        fontSize: 16, color: Primary.mainColor),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Rp. 2.000',
                                    style: bold.copyWith(
                                        fontSize: 16, color: Primary.subtle),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Rp. 152.000',
                                    style: bold.copyWith(
                                        fontSize: 16, color: Primary.mainColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: 380,
                            height: 74,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Neutral.light3,
                              boxShadow: [blur8, blur4],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '0 Poin',
                                        style: bold.copyWith(
                                            fontSize: 12,
                                            color: Primary.mainColor),
                                      ),
                                      // SizedBox(height: 4),
                                      Text(
                                        'Saldo Poin',
                                        style: regular.copyWith(
                                            fontSize: 12, color: Neutral.dark2),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => Switch(
                                      value: switchController.isSwitched.value,
                                      onChanged: (value) {
                                        switchController.toggleSwitch(value);
                                      },
                                      activeColor: Neutral.light4,
                                      inactiveThumbColor: Neutral.light4,
                                      activeTrackColor: Neutral.light2,
                                      inactiveTrackColor: Neutral.light2,
                                      trackOutlineColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: 380,
                            height: 72,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Neutral.light3,
                              boxShadow: [blur8, blur4],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/Check-Box.svg'),
                                      const Gap(20),
                                      Text(
                                        'Midtrans',
                                        style: medium.copyWith(
                                          fontSize: 16,
                                          color: Neutral.dark1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/logomidtrans.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          MainButton(
                            label: 'Buat Jadwal',
                            onTap: () => Get.toNamed(Routes.PAYMENTPROCESSED),
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
