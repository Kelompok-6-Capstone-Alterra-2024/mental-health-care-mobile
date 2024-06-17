import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';

class SwitchGender extends StatelessWidget {
  final Function()? onTap;
  final bool isSwitched;
  const SwitchGender({super.key,
    this.onTap,
    required this.isSwitched,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin',
          style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
        ),
        const SizedBox(height: 8),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: onTap,
                  child: Chip(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 28),
                    label: Text(
                      'Laki-laki',
                      style: semiBold.copyWith(
                          fontSize: 16,
                          color: isSwitched
                              ? Neutral.dark4
                              : Neutral.light1),
                    ),
                    backgroundColor: isSwitched
                        ? Neutral.light1
                        : Primary.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: onTap,
                  child: Chip(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 28),
                    label: Text(
                      'Perempuan',
                      style: semiBold.copyWith(
                          fontSize: 16,
                          color: isSwitched
                              ? Neutral.light1
                              : Neutral.dark4),
                    ),
                    backgroundColor: isSwitched
                        ? Primary.mainColor
                        : Neutral.light1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
