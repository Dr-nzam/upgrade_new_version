import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_page.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   
  @override
  Widget build(BuildContext context) {
    Get.put(UserModel());
    Get.put(EvaluationModel());
    Get.put(DepartementModel());
    Get.put(StatistiqueModel());
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,
      getPages: AppPage.page,

    );
  }
}