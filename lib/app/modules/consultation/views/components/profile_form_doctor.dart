import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class ProfileFormDoctor extends StatelessWidget {
  final String name;
  final String specialist;
  final String urlImage;
  const ProfileFormDoctor({
    super.key,
    required this.name,
    required this.specialist,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 63,
          width: 63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
              image: NetworkImage(urlImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gap(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: medium.copyWith(fontSize: 16, color: Neutral.dark1),
            ),
            Text(
              specialist,
              style: regular.copyWith(fontSize: 12, color: Neutral.dark2),
            ),
          ],
        )
      ],
    );
  }
}
