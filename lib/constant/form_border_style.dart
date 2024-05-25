part of 'constant.dart';

InputDecoration primary = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Neutral.dark4),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Neutral.dark1),
    borderRadius: BorderRadius.circular(30),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Error.subtle),
    borderRadius: BorderRadius.circular(30),
  ),
);

InputDecoration searchStyle = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Neutral.dark4, width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Neutral.dark1, width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Error.subtle, width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
);
