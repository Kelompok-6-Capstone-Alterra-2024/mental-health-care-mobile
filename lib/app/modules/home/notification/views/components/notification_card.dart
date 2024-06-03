import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../constant/constant.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  final String time;
  final Color textColor;
  final Color status;
  final Color backgroundColor;
  const NotificationCard({
    super.key,
    required this.message,
    required this.time,
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
          Icon(
            Icons.info_outline,
            color: status,
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: regular.copyWith(fontSize: 12, color: textColor),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(8),
                Text(
                  time,
                  style: semiBold.copyWith(fontSize: 12, color: status),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
