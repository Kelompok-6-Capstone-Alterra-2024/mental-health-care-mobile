import 'package:flutter/material.dart';

import '../../../../../../constant/constant.dart';

class OtherServiceCards extends StatelessWidget {
  final String image;
  final String featureName;
  final String title;
  const OtherServiceCards({
    super.key,
    required this.image,
    required this.featureName,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, bottom: 8),
      width: 142,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [blur8, blur4],
        color: Neutral.light4,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 48,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  featureName,
                  style: regular.copyWith(
                    fontSize: 8,
                    color: Neutral.dark1,
                  ),
                ),
                Text(
                  title,
                  style: medium.copyWith(
                    fontSize: 12,
                    color: Neutral.dark1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
