import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/routes/app_pages.dart';

import '../controllers/consultation_controller.dart';
import '../../../../constant/constant.dart';
import 'components/doctor_card.dart';

class ConsultationView extends GetView<ConsultationController> {
  const ConsultationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Psikiater',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/Chevron.svg',
              width: 26,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.CHATLIST);
            },
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
                    decoration: primary.copyWith(
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
                      return DoctorCard(
                        image: 'assets/images/Avatar1.png',
                        name: 'Dr. Andy Sp.KJ',
                        title: 'Sp. Jiwa',
                        yearsofservice: '14 Tahun',
                        rating: '95%',
                        price: 'Rp. 150.000',
                        like: () {},
                        onTapButton: () => Get.toNamed(Routes.DETAILPSIKIATER),
                        onTapCard: () => Get.toNamed(Routes.DETAILPSIKIATER),
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
