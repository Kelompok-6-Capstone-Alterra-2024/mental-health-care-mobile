import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import '../../../../../constant/constant.dart';
import '../controllers/ai_chat_controller.dart';

class AiChatView extends GetView<AiChatController> {
  const AiChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Ai Chat',
            style: medium.copyWith(fontSize: 16, color: Primary.darker),
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
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bergabung 09:30',
              style: regular.copyWith(fontSize: 12),
            ),
            const Gap(10),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 1),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.6,
                    ),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Neutral.light2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Hello, How can I help you sldkfjsdfljklskdjflsddfjlkajsd?',
                      style:
                          regular.copyWith(fontSize: 12, color: Neutral.dark1),
                      maxLines: 4,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/ai_avatar.png',
                    width: 40,
                  ),
                )
              ],
            ),
            const Gap(10),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 1),
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Primary.mainColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Text(
                      'Hello, How can I help you?',
                      style:
                          regular.copyWith(fontSize: 12, color: Neutral.light1),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/ai_avatar.png',
                    width: 40,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
