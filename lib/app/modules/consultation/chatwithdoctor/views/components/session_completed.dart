import 'package:flutter/material.dart';
import 'package:mindease/constant/constant.dart';

class SessionCompleted extends StatelessWidget {
  final String time;
  const SessionCompleted({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Success.subtle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Text(
              'Konsultasi Selesai $time',
              style: regular.copyWith(
                fontSize: 12,
                color: Neutral.dark1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
