import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../../constant/constant.dart';
import '../../../../../../utils/global_components/book_button.dart';

class RoomChatCard extends StatelessWidget {
  final String name;
  final String specialist;
  final bool isRejected;
  final String status;
  final Color bgBadgeStatus;
  final Color textBadgeStatus;
  final String urlImage;
  final Function()? onTap;
  const RoomChatCard({
    super.key,
    required this.name,
    required this.specialist,
    required this.isRejected,
    required this.status,
    required this.bgBadgeStatus,
    required this.textBadgeStatus,
    required this.urlImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: double.infinity,
              height: 142,
              decoration: BoxDecoration(
                boxShadow: [blur8, blur4],
                color: Neutral.light4,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 63,
                          width: 63,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: NetworkImage(urlImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    name,
                                    style: medium.copyWith(
                                        fontSize: 16, color: Neutral.dark1),
                                  ),
                                  Text(
                                    '19:22',
                                    style: medium.copyWith(
                                        fontSize: 12, color: Neutral.dark3),
                                  ),
                                ],
                              ),
                              Text(
                                specialist,
                                style: regular.copyWith(
                                    fontSize: 12, color: Neutral.dark2),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Gap(10),
                    Divider(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            status,
                            style: semiBold.copyWith(
                              fontSize: 12,
                              color: Neutral.dark2,
                            ),
                          ),
                          BookButton(
                            label: 'chat',
                            backgroundColor: bgBadgeStatus,
                            textColor: textBadgeStatus,
                            onTap: () {
                              // Get.toNamed(Routes.CHATWITHDOCTOR);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 142,
            decoration: BoxDecoration(
              color: isRejected
                  ? Neutral.light4.withOpacity(0.5)
                  : Neutral.transparent, //Neutral.light4..withOpacity(0.5)
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
