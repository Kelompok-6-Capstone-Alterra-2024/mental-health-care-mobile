import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class CustomFormPassword extends StatelessWidget {
  final String title;
  final Function(String)? onChanged;
  final bool obsecure;
  final obsecureIcon;
  final controller;
  const CustomFormPassword({
    super.key,
    required this.title,
    this.onChanged,
    required this.obsecure,
    this.obsecureIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
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
            obscureText: obsecure,
            controller: controller,
            decoration: primary.copyWith(
              suffixIcon: obsecureIcon,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            ),
          ),
        ],
      ),
    );
  }
}
