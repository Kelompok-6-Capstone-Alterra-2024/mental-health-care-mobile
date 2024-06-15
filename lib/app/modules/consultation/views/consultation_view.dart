import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mindease/app/modules/consultation/data/models/doctor_model.dart';
import 'package:mindease/app/modules/consultation/data/services/doctor_services.dart';
import 'package:mindease/app/routes/app_pages.dart';

import '../controllers/consultation_controller.dart';
import '../../../../constant/constant.dart';
import 'components/doctor_card.dart';

class ConsultationView extends GetView<ConsultationController> {
  const ConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
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
                  FutureBuilder<DoctorModel>(
                      future: DoctorServices().getAllDoctor(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DoctorModel> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('Terjadi kesalahan'),
                          );
                        } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.data == null || snapshot.data!.data.isEmpty) {
                          return const Center(
                            child: Text('Data kosong'),
                          );
                        } else {
                        final doctorList = snapshot.data!.data.toList();
                        controller.doctorsList.value = doctorList;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.doctorsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final doctor = controller.doctorsList[index];
                              return DoctorCard(
                                image: 'assets/images/Avatar1.png',
                                name: doctor.name,
                                title: doctor.specialist,
                                yearsofservice: doctor.experience.toString(),
                                rating: '90',
                                price: doctor.fee.toString(),
                                like: () {},
                                onTapCard: () {
                                    Get.toNamed(Routes.DETAILPSIKIATER,);
                                    controller.idDoctor.value = doctor.id;
                                    controller.nameDoctor.value = doctor.name;
                                    controller.specialistDoctor.value = doctor.specialist;
                                    controller.experienceDoctor.value = doctor.experience.toString();
                                    controller.feeDoctor.value = doctor.fee;
                                    controller.imageDoctor.value = 'assets/images/Avatar1.png';
                                    controller.rateDoctor.value = '90';
                                    controller.locationDoctor.value = doctor.address;
                                    controller.educationDoctor.value = doctor.almamater;
                            });
                            },
                          );
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
