import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class MusicCard extends StatelessWidget {
  final String image;
  final String title;
  final String artist;
  final Function()? like;
  final Function()? onTap;
  const MusicCard({
    super.key,
    required this.image,
    required this.title,
    required this.artist,
    this.like,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          border: Border.all(
            color: Neutral.dark4,
            width: 0.2,
          ),
          color: Neutral.light4,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            blur4,
            blur8,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn-2.tstatic.net/bali/foto/bank/images/ilustrasi-meditasi.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: semiBold.copyWith(
                          fontSize: 16,
                          color: Neutral.dark1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(8),
                      Text(
                        artist,
                        style: regular.copyWith(
                          fontSize: 12,
                          color: Neutral.dark3,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //
                  },
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/Heart.svg',
                      width: 20,
                    ),
                    onPressed: like,
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
