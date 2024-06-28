import 'package:flutter/material.dart';

import '../../../../../../constant/constant.dart';

class ChatItem extends StatelessWidget {
  final bool isSender;
  final String chat;
  const ChatItem({
    super.key,
    required this.isSender,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 330,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSender ? Primary.mainColor : Neutral.light2,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                chat,
                style: regular.copyWith(
                  fontSize: 12,
                  color: isSender ? Neutral.light4 : Neutral.dark1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
