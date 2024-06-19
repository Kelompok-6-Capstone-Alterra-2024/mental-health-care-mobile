import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';
import '../../../../../utils/global_components/book_button.dart';
import '../../../../../utils/global_components/main_button.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String yearsofservice;
  final String rating;
  final String price;
  final Function()? like;
  final Function()? onTapCard;
  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.yearsofservice,
    required this.rating,
    required this.price,
    this.like,
    this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          boxShadow: [blur8, blur4],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 148,
              height: 148,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                  ),
                  Text(
                    title,
                    style: regular.copyWith(fontSize: 12, color: Neutral.dark2),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Suitcase-1.svg',
                      ),
                      Text(
                        yearsofservice,
                        style: semiBold.copyWith(
                            fontSize: 12, color: Primary.mainColor),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/icons/Top-1.svg',
                      ),
                      Text(
                        rating,
                        style: semiBold.copyWith(
                            fontSize: 12, color: Primary.mainColor),
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style:
                        semiBold.copyWith(fontSize: 16, color: Neutral.dark2),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.bottomRight,
                    child: BookButton(
                      label: 'Book',
                      backgroundColor: Primary.mainColor,
                      textColor: Colors.white,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
