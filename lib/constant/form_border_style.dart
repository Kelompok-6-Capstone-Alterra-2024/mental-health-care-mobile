part of 'constant.dart';

InputDecoration primary = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Neutral.dark5),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:  BorderSide(color: Neutral.dark1),
    borderRadius: BorderRadius.circular(30),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Error.subtle),
    borderRadius: BorderRadius.circular(30),
  ),
);

InputDecoration searchStyle = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide:  BorderSide(color: Neutral.dark5, width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:  BorderSide(color: Neutral.dark1, width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Error.subtle, width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
);
