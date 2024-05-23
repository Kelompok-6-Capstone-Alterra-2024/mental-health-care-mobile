import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/splash/bindings/splash_binding.dart';
import 'app/routes/app_pages.dart';
import 'constant/theme.dart';

void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MindEase",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.themeData,
      initialBinding: SplashBinding(),
    ),
  );
}
