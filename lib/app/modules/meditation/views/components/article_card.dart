import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class ArticleCard extends StatelessWidget {
  final String image;
  final String title;
  final String time;
  final String readTime;
  final Function()? onTap;

  const ArticleCard({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.readTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Neutral.dark4,
              width: 0.2,
            ),
            color: Neutral.light4,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              blur4,
              blur8,
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 123,
                    width: 142,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Panduan Lengkap untuk Meditasi Harian',
                            style: semiBold.copyWith(
                              fontSize: 16,
                              color: Neutral.dark1,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Gap(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '3 Jam yang lalu',
                                style: regular.copyWith(
                                  fontSize: 10,
                                  color: Neutral.dark3,
                                ),
                              ),
                              Text(
                                'Bacaan 2 menit',
                                style: regular.copyWith(
                                  fontSize: 10,
                                  color: Neutral.dark3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
