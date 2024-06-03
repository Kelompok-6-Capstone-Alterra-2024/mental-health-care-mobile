import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../../../constant/constant.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  final Color textColor;
  final Color status;
  final Color backgroundColor;
  const NotificationCard({
    super.key,
    required this.message,
    required this.textColor,
    required this.status,
    required this.backgroundColor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          blur4,
          blur8,
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: status,
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Waktunya untuk konsultasi! Jadwalkan sesi dengan psikiater Anda sekarang untuk mendapatkan dukungan yang Anda butuhkan.',
                  style: regular.copyWith(fontSize: 12, color: textColor),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(8),
                Text(
                  '1 jam yang lalu',
                  style: semiBold.copyWith(fontSize: 12, color: textColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
