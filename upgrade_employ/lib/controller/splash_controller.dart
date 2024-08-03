import 'dart:async';
import 'package:get/get.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/data/secure_stokage.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:upgrade_employ/network/authentification_service.dart';

// class SplashController extends GetxController{

//   Timer? timer;
//  void movePageSplash() {
//     timer = Timer.periodic(const Duration(seconds: 5), (Timer) {
//       Get.offNamed(AppRoute.login);
//     });
//   }

// /* permet de detruire le Timer lorsque le controlleur n'est
// pas utiliser pour ne pas avoir un comportement inattendu*/
//   @override
//   void onClose() {
//     timer?.cancel();
//     super.onClose();
//   }

// }

class SplashController extends GetxController {
  bool loading = false.obs.value;
  final UserModel user = Get.put(UserModel());

  final AuthentificationService _provider = AuthentificationService();
  final SecureStorage secureStorage = SecureStorage();
  Future<void> movePageSplash(String token, String firstconnect) async {
    loading = true;
    var response = await _provider.infoUseGet(token);
    if (!response.status.hasError) {
      loading = false;
      if (response.statusCode == 200) {
        List don = [response.body];
        user.donnees.value = don;
        user.token.value  = {"token":token};
        loading = false;
        print(user.token);
        print("toto");
          Get.offNamed(AppRoute.core);
      }
    } else {
      loading = false;
      if (firstconnect == "true") {
        
        Get.offNamed(AppRoute.login);
      } else {
        Get.offNamed(AppRoute.core);
      }
    }
  }}