import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          boxShadow: [blur8, blur4],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 154.4127,
              height: 148,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        child: Text(
                          name,
                          style: semiBold.copyWith(
                              fontSize: 16, color: Neutral.dark1),
                        ),
                      ),
                      GestureDetector(
                        onTap: like,
                        child: SvgPicture.asset(
                          'assets/icons/Heart.svg',
                        ),
                      ),
                    ],
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
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style:
                        semiBold.copyWith(fontSize: 16, color: Neutral.dark2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 115, top: 5),
                    child: BookButton(label: 'Book',backgroundColor: Primary.mainColor, textColor: Neutral.light4, onTap: () {}),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
