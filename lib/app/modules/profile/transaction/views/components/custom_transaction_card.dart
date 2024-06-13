import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../constant/constant.dart';


class CustomTransactionCard extends StatelessWidget {
  final String image;
  final String doctor;
  final String date;
  final String price;
  final String status;
  final Color colorStatus;
  const CustomTransactionCard({
    required this.image,
    required this.doctor,
    required this.date,
    required this.price,
    required this.status,
    required this.colorStatus,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Neutral.light4,
        boxShadow: [
          blur4,
          blur8
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Neutral.dark3,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor,
                  style: bold.copyWith(fontSize: 16),
                ),
                Text(
                  date,
                  style: regular.copyWith(
                      fontSize: 12, color: Neutral.dark3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: semiBold.copyWith(fontSize: 16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: colorStatus,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(status,
                          style: regular.copyWith(
                              fontSize: 12, color: Neutral.light1)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
