import 'package:flutter/material.dart';

import '../../constant/constant.dart';

// ignore: must_be_immutable
class CustomForm extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;
  bool? obscureText;
  final Widget? icon;
  final String? Function(String?)? validator;

  CustomForm({
    super.key,
    required this.title,
    required this.onChanged,
    this.obscureText,
    this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      style: regular.copyWith(fontSize: 14, color: Neutral.dark1),
      decoration: primary.copyWith(
        hintText: title,
        hintStyle: regular.copyWith(
          fontSize: 14,
          color: Neutral.dark2,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: icon,
        ),
      ),
    );
  }
}
