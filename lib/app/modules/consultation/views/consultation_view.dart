import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../controllers/consultation_controller.dart';
import '../../../../constant/constant.dart';

class ConsultationView extends GetView<ConsultationController> {
  const ConsultationView({Key? key}) : super(key: key);
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/History.svg'),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextField(
                    decoration: searchStyle.copyWith(
                      hintText: 'Temukan meditasimu disini',
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: SvgPicture.asset(
                            'assets/icons/Search.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                          height: 16, color: Colors.transparent);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAILPSIKIATER),
                        child: Container(
                          height: 148,
                          width: 380,
                          decoration: BoxDecoration(
                            boxShadow: [blur8, blur4],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 154.4127,
                                height: 148,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/Avatar1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 160,
                                          child: Text(
                                            "Dr. Andy Sp.KJ",
                                            style: semiBold.copyWith(
                                                fontSize: 16,
                                                color: Neutral.dark1),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print('Button Favorite Pressed');
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/Heart.svg',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Sp. Jiwa",
                                      style: regular.copyWith(
                                          fontSize: 12, color: Neutral.dark2),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/Suitcase-1.svg',
                                        ),
                                        Text(
                                          "14 Tahun",
                                          style: semiBold.copyWith(
                                              fontSize: 12,
                                              color: Primary.mainColor),
                                        ),
                                        const SizedBox(width: 10),
                                        SvgPicture.asset(
                                          'assets/icons/Top-1.svg',
                                        ),
                                        Text(
                                          "95 %",
                                          style: semiBold.copyWith(
                                              fontSize: 12,
                                              color: Primary.mainColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Rp. 150.000",
                                      style: semiBold.copyWith(
                                          fontSize: 16, color: Neutral.dark2),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 115, top: 5),
                                      child: BookButton(
                                        label: 'Book',
                                        onTap: () {
                                          print('Button Gook Pressed');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
