import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class CustomFormProfile extends StatelessWidget {
  final String title;
  final String hinttext;
  final Function(String)? onChanged;
  final TextEditingController controller;
   CustomFormProfile({
    super.key,
    required this.title,
    required this.hinttext,
    this.onChanged,
    required this.controller,
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
            controller: controller,
            decoration: primary.copyWith(
              
              hintText: hinttext,
              hintStyle: regular.copyWith(
                fontSize: 16,
                color: Neutral.dark3,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
