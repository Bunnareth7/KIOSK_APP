import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kiosk App',
      //initialRoute: Routes.LOGIN,
     // initialRoute: Routes.SPLASH,
     initialRoute: Routes.START_ORDER,
     //initialRoute: Routes.HOME,
     //initialRoute: Routes.SELECT_TERMINAL,
       // Set initial route
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}