import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrade_employ/navigation/app_page.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(

      // theme: ThemeData( 
      //   pr
      // ),
      initialRoute: AppRoute.splash,
      getPages: AppPage.page,

    );
  }
}