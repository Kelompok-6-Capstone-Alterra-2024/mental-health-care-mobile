import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';


class CustomFormConsultation extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final int? maxLines;
  final TextInputType? keyboardType;
  const CustomFormConsultation({
    super.key,
    required this.label,
    required this.hintText,
    this.maxLines,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: primary.copyWith(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 16),
            hintStyle:
                regular.copyWith(fontSize: 16, color: Neutral.dark3),
          ),
        ),
      ],
    );
  }
}
