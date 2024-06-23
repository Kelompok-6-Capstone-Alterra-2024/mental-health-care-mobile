import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../constant/constant.dart';
import '../controllers/customer_services_controller.dart';

class CustomerServicesView extends GetView<CustomerServicesController> {
  const CustomerServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Neutral.light1,
      appBar: AppBar(
        title: Text(
          'Customer Service Chatbot',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        leading: IconButton(
          color: Neutral.light4,
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.clearMessages();
              },
              icon: Icon(
                Icons.delete,
                color: Neutral.dark1,
              ))
        ],
      ),
      body: Column(
        children: [
          const Gap(8),
          Obx(
            () {
              return controller.isConnected.value
                  ? Text(
                      'Terhubung',
                      style: regular.copyWith(
                          color: Success.mainColor, fontSize: 12),
                    )
                  : Column(
                      children: [
                        Text(
                          'Tidak Terhubung',
                          style: regular.copyWith(
                              color: Error.mainColor, fontSize: 12),
                        ),
                        Text(
                          controller.errorMessage.value,
                          style: regular.copyWith(
                              color: Neutral.dark1, fontSize: 12),
                        ),
                      ],
                    );
            },
          ),
          const Gap(4),
          Text(
              'Hari ini, ${DateFormat('HH:mm').format(controller.currentTime.value)} WIB',
              style: regular.copyWith(fontSize: 12, color: Neutral.dark1)),
          const Gap(16),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return Align(
                    alignment: message.isMine
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: Get.width * 0.8),
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(
                          bottom: 16, left: 24, right: 24),
                      decoration: BoxDecoration(
                        color:
                            message.isMine ? Primary.mainColor : Neutral.light3,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        message.text,
                        style: regular.copyWith(
                            color:
                                message.isMine ? Neutral.light1 : Neutral.dark1,
                            fontSize: 12),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Container(
            decoration: BoxDecoration(
              color: Neutral.light3,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageController,
                    // onSubmitted: (value) {
                    //   controller.sendMessage(value);
                    // },
                    decoration: primary.copyWith(
                      hintText: 'Tulis pesan',
                      hintStyle: regular.copyWith(
                        color: Neutral.dark3,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                GestureDetector(
                  onTap: () {
                    controller.sendMessage(controller.messageController.text);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Primary.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Send1.svg',
                      width: 24,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
