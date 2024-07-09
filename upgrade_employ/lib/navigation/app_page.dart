
import 'package:get/get.dart';
import 'package:upgrade_employ/liaison/splash_binding.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:upgrade_employ/screens/add_user.dart';
import 'package:upgrade_employ/screens/core.dart';
import 'package:upgrade_employ/screens/login.dart';
import 'package:upgrade_employ/screens/splash.dart';

class AppPage{
  static  List<GetPage> page =[
    GetPage(name: AppRoute.splash, page: ()=> Splash(), binding: SplashBinding()),
    GetPage(name: AppRoute.login, page: ()=>Login()),
    GetPage(name: AppRoute.core, page: ()=>Core()),
    GetPage(name: AppRoute.addUser, page: ()=>AddUser()),
  ];
}