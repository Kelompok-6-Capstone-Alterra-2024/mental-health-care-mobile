import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/constant/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'constant/theme.dart';

void main() async {
  WidgetsFlutterBinding();
  await GetStorage.init();
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