import 'package:get/get.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';


class EvaluationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EvaluationController>(()=>EvaluationController());
  }
  
}