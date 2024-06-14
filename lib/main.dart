import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mindease/constant/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding();
  await GetStorage.init();
  await initializeDateFormatting();
  Intl.defaultLocale = 'id_ID';

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MindEase",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.themeData,
    ),
  );
}