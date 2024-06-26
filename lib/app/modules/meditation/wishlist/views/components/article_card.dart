import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../../constant/constant.dart';

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
                      image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
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
                            title,
                            style: semiBold.copyWith(
                              fontSize: 16,
                              color: Neutral.dark1,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Gap(16),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  (time),
                                  style: regular.copyWith(
                                    fontSize: 10,
                                    color: Neutral.dark3,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                readTime,
                                style: regular.copyWith(
                                  fontSize: 10,
                                  color: Neutral.dark3,
                                ),
                                overflow: TextOverflow.ellipsis,
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
