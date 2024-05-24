import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

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
      decoration: InputDecoration(
        isDense: false,
        filled: true,
        hintText: title,
        hintStyle:
            const TextStyle(color: Neutral.dark2, fontWeight: FontWeight.w400),
        fillColor: Neutral.light4,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Neutral.dark4),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Neutral.dark1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Error.subtle),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: icon ?? null,
        ),
      ),
    );
  }
}
