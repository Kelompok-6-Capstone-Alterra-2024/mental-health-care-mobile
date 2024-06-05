import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/constant/constant.dart';

SvgPicture moodStatusIcon(String check) {
  switch (check) {
    case '1':
      return SvgPicture.asset(
        'assets/icons/grin-calendar.svg',
        width: 20,
      );
    case '2':
      return SvgPicture.asset(
        'assets/icons/smile-calendar.svg',
        width: 20,
      );
    case '3':
      return SvgPicture.asset(
        'assets/icons/meh-calendar.svg',
        width: 20,
      );
    case '4':
      return SvgPicture.asset(
        'assets/icons/sad-calendar.svg',
        width: 20,
      );
    case '5':
      return SvgPicture.asset(
        'assets/icons/depression-calendar.svg',
        width: 20,
      );
    case '':
      return SvgPicture.asset(
        'assets/icons/default-calendar.svg',
        width: 20,
      );
    default:
      return SvgPicture.asset(
        'assets/icons/default-calendar.svg',
        width: 20,
      );
  }
  
}


Color moodStatusColor(String check) {
  switch (check) {
    case '1':
      return Color(0xffF8C6FF);
    case '2':
      return Color(0xffcdfcbf);
    case '3':
      return Color(0xffFBF198);
    case '4':
      return Color(0xff9EE2FF);
    case '5':
      return Color(0xffffebe7);
    case '':
      return  Neutral.light2;
    default:
      return Color(0xffE0E0E0);
  }
}