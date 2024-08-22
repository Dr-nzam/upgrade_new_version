import 'package:get/get.dart';

class UserModel extends GetxService{
  var token = {}.obs;
  var donnees = [].obs;
  var listUser = [].obs;
}

class EvaluationModel extends GetxService{
  var donnees = [].obs;
  var historique = [].obs;
  var question = [].obs;
  var participation = [].obs;
  
}

class DepartementModel extends GetxService{
  var donnees = [].obs;
}

class StatistiqueModel extends GetxService{
  var donnees = [].obs;
  var suivis = [].obs;
  var suivisGenerale = [].obs;
}