import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/modules/consultation/views/components/switch_gender.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';
import '../../controllers/consultation_controller.dart';
import '../../../../../constant/constant.dart';
import '../components/custom_form_consultation.dart';
import '../components/profile_form_doctor.dart';

class FormConsultationView extends GetView<ConsultationController> {
  FormConsultationView({Key? key}) : super(key: key);
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
              CustomFormConsultation(
                label: 'Nama Pasien',
                hintText: 'Masukkan nama',
                onChanged: controller.setName,
              ),
              const SizedBox(height: 12),
              CustomFormConsultation(
                label: 'Usia',
                hintText: 'Masukkan usia',
                onChanged: controller.setAge,
                keyboardType: TextInputType.number,
              ),
              const Gap(12),
              Obx(() => SwitchGender(
                    isSwitched: controller.isSwitched.value,
                    onTap: () {
                      controller.isSwitched.value =
                          !controller.isSwitched.value;
                      controller.setGender(controller.isSwitched.value);
                    },
                  )),
              const SizedBox(height: 12),
              CustomFormConsultation(
                label: 'Pesan',
                hintText: 'Masukkan pesan untuk konsultasi',
                maxLines: 4,
                onChanged: controller.setMessage,
              ),
              const SizedBox(height: 16),
              CustomFormConsultation(
                label: 'Riwayat Kesehatan',
                hintText: 'Masukkan riwayat kesehatan',
                onChanged: controller.setMedicalHistory,
              ),
              const Gap(16),
              MainButtonWithoutPadding(
                        label: 'Kirim Formulir',
                        onTap: () {
                          controller.createComplaint(
                            controller.consultationId.value,
                          );
                        },
                      ),
              // Obx(
              //   () => controller.isLoading.value == true
              //       ? Center(child: CircularProgressIndicator())
              //       : MainButtonWithoutPadding(
              //           label: 'Kirim Formulir',
              //           onTap: () {
              //             controller.createComplaint(
              //               controller.consultationId.value,
              //             );
              //           },
              //         ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
