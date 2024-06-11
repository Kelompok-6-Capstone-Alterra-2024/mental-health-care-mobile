import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class CustomFormProfile extends StatelessWidget {
  final String title;
  final Function(String)? onChanged;
  const CustomFormProfile({
    super.key,
    required this.title,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: regular.copyWith(fontSize: 16),
          ),
          const Gap(6),
          TextFormField(
            onChanged: onChanged,
            decoration: primary.copyWith(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
