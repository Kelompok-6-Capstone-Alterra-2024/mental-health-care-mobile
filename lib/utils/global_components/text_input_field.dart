import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class InputField extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;
  final bool obscureText;
  final Widget? icon;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.title,
    required this.onChanged,
    this.obscureText = false,
    this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      style: regular.copyWith(fontSize: 14, color: Neutral.dark1),
      decoration: primary.copyWith(
        hintText: title,
        hintStyle: regular.copyWith(
          fontSize: 14,
          color: Neutral.dark2,
        ),
        suffixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: icon,
              )
            : null,
      ),
    );
  }
}
