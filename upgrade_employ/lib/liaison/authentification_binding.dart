import 'package:get/get.dart';
import 'package:upgrade_employ/controller/authentification_controller.dart';

class AuthentificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthentificationController>(()=>AuthentificationController());
  }
  
}