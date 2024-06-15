import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mindease/constant/constant.dart';

import '../../data/models/posts_model.dart';

class PostCard extends StatelessWidget {
  final AllPost postData;

  const PostCard({
    Key? key,
    required this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
      decoration: BoxDecoration(
        color: Neutral.light3,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          blur4,
          blur8,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(postData.user.profilePicture),
                ),
                const Gap(16),
                Text(
                  postData.user.username,
                  style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
              ],
            ),
            const Gap(16),
            Text(
              postData.content,
              style: regular.copyWith(fontSize: 12, color: Neutral.dark1),
            ),
            if (postData.imageUrl.isNotEmpty) ...[
              const Gap(10),
              Image.network(
                postData.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ],
            const Gap(10),
            const Divider(color: Neutral.dark3),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionItem('Suka', 'assets/icons/like.svg'),
                _buildActionItem('Komentar', 'assets/icons/comment.svg'),
                _buildActionItem('Bagi', 'assets/icons/share2.svg'),
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(String title, String iconPath) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        const Gap(6),
        Text(
          title,
          style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
        ),
      ],
    );
  }
}
