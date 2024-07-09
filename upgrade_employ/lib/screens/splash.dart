import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/data/secure_stokage.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:upgrade_employ/controller/splash_controller.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   String texte = '';
//   SplashController controller = SplashController();
//   @override
//   Widget build(BuildContext context) {
//     controller.movePageSplash();
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           '${Constante.imagePath}logo.jpg',
//         ),
//       ),
//     );
//   }
// }


class Splash extends StatelessWidget {
  Splash({super.key});
  SplashController controller = Get.find<SplashController>();
  final SecureStorage secureStorage = SecureStorage();

  Future<void> init() async {
    String? token = await fetchToken();
    String? firstConnect = await fetchFirstConnect();
    controller.movePageSplash(token!, firstConnect!);
  }

  Future<String?> fetchToken() async {
    String? token = await secureStorage.getToken();
    return token ?? '';
  }
  Future<String?> fetchFirstConnect() async {
    String? firstConnect = await secureStorage.getFirstInstall();
    return firstConnect ?? '';
  }
  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: Center(
        child: Image.asset(
          '${Constante.imagePath}logo.jpg',
        ),
      ),
    );
  }
}