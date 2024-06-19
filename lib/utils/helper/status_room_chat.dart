
import 'package:flutter/material.dart';
import 'package:mindease/constant/constant.dart';

String statusRoomChat(String status) {
  switch (status) {
    case 'active':
      return 'Konsultasi Berlangsung';
    case 'process':
      return 'Menghubungkan ke Psikiater';
    case 'completed':
      return 'Percakapan ini telah selesai';
    default:
      return 'Semua';
  }
}

Color bgBadgeStatus(String status) {
  switch (status) {
    case 'active':
      return Primary.mainColor;
    case 'process':
      return Neutral.light2;
    case 'completed':
      return Neutral.transparent;
    default:
      return Colors.grey;
  }
}

Color textBadgeStatus(String status) {
  switch (status) {
    case 'active':
      return Neutral.light4;
    case 'process':
      return Neutral.dark4;
    case 'completed':
      return Neutral.transparent;
    default:
      return Colors.grey;
  }
}