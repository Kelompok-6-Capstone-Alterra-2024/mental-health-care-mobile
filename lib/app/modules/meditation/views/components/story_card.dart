import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class StoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String time;
  final Function()? like;
  final Function()? onTap;
  const StoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.time,
    this.like,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
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
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'By : ${author}',
                              style: regular.copyWith(
                                fontSize: 10,
                                color: Neutral.dark3,
                              ),
                            ),
                            Text(
                              time,
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
      ),
    );
  }
}
