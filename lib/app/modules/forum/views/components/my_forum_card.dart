import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constant/constant.dart';

class MyForumCard extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String imageUrl;
  final List<String> profilePictures;

  const MyForumCard({
    super.key,
    required this.title,
    this.onTap,
    required this.imageUrl,
    required this.profilePictures,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Neutral.light4,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            blur4,
            blur8,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 202,
              height: 145,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  blur4,
                  blur8,
                ],
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Container(
                  width: 200,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:
                        semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                  ),
                ),
                const Gap(10),
                Stack(
                  children: [
                    for (int i = 0; i < profilePictures.length; i++)
                      Positioned(
                        left: i * 15.0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(profilePictures[0]),
                        ),
                      ),
                    Row(
                      children: List.generate(
                        profilePictures.length,
                        (index) => const CircleAvatar(
                          radius: 15,
                          // child: Text(
                          //   '${profilePictures.length}+',
                          //   style: semiBold.copyWith(
                          //       fontSize: 16, color: Neutral.dark1),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
