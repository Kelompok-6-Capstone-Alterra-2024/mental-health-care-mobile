import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';


class ChangeEmailCard extends StatelessWidget {
  final String emailAddress;
  final Function()? onTap;

  const ChangeEmailCard({
    super.key,
    required this.emailAddress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Neutral.light4,
                boxShadow: [
                  BoxShadow(
                    color: Neutral.dark1.withOpacity(0.048),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: Neutral.dark1.withOpacity(0.08),
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Primary.mainColor,
                    child: SvgPicture.asset(
                      'assets/icons/Email2.svg',
                    ),
                  ),
                  Gap(20),
                  Text(
                    emailAddress,
                    style: medium.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Email Terverifikasi',
                    style: regular.copyWith(fontSize: 16, color: Neutral.dark3),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Primary.mainColor,
                      ),
                      child: Text(
                        'ubah alamat email',
                        style: semiBold.copyWith(
                            fontSize: 16, color: Neutral.light4),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}
