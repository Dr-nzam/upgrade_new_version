// import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrade_employ/data/model.dart';
// import 'package:upgrade_employ/data/secure_stokage.dart';
import 'package:upgrade_employ/network/evaluation_service.dart';

class EvaluationController extends GetxController {
  var messageObs = ''.obs;
  var loading = false.obs;
  final departementModel = Get.put(DepartementModel());
  final evaluationModel = Get.put(EvaluationModel());
  final statistiqueModel = Get.put(StatistiqueModel());
  final EvaluationServiceProvider _provider = EvaluationServiceProvider();

  Future<Response> ajouterEvaluation(
      String nom,
      String dateDebut,
      String dateFin,
      String heureDebut,
      String heureFin,
      int departement,
      String token) async {
    loading.value = true;
    var response = await _provider.ajouterEvaluationPost(
      {
        'nom': nom,
        'dateDebut': dateDebut,
        'dateFin': dateFin,
        'heureDebut': heureDebut,
        'heureFin': heureFin,
        'departement': departement
      },
      token,
    );
    if (response.statusCode != null) {
      if (!response.status.hasError) {
        messageObs.value = response.body["message"];
        loading.value = false;
        return response;
      } else {
        messageObs.value = response.body["message"];
        loading.value = false;
        return response;
      }
    } else {
      messageObs.value = "Erreur de connexion au server*";
      loading.value = false;
      return response;
    }
  }

  Future<void> allDepartement(String token) async {
    loading.value = true;
    //  final HomeProvider provider = HomeProvider();
    var response = await _provider.listeDepartementGet(token);
    if (!response.status.hasError) {
      departementModel.donnees.value = response.body;
      loading.value = false;
      print("########################################");
      print(response.body);
    } else {
      loading.value = true;
    }
  }

  Future<List<dynamic>> evaluationFuture(String token) async {
    loading.value = true;
    //  final HomeProvider provider = HomeProvider();
    var response = await _provider.evaluationFutureGet(token);
    if (!response.status.hasError) {
      evaluationModel.donnees.value = response.body;
      loading.value = false;
      // print("########################################");
      // print(response.body);
      return response.body;
    } else {
      loading.value = true;
      return [
        {"message": "Error request"}
      ];
    }
  }

  Future<List<dynamic>> statistique(String token) async {
    loading.value = true;

    var response = await _provider.statistiqueGet(token);
    if (!response.status.hasError) {
      statistiqueModel.donnees.value = response.body;
      loading.value = false;
      // print("########################################");
      // print(response.body);
      return response.body;
    } else {
      loading.value = true;
      return [
        {"message": "Error request"}
      ];
    }
  }

  Future<List<dynamic>> historique(String token) async {
    loading.value = true;
    //  final HomeProvider provider = HomeProvider();
    var response = await _provider.historiqueGet(token);
    if (!response.status.hasError) {
      evaluationModel.historique.value = response.body;
      loading.value = false;
      // print("########################################");
      // print(response.body);
      return response.body;
    } else {
      loading.value = true;
      return [
        {"message": "Error request"}
      ];
    }
  }

  Future<List<dynamic>> question(String token) async {
    loading.value = true;
    //  final HomeProvider provider = HomeProvider();
    var response = await _provider.questionGet(token);
    if (!response.status.hasError) {
      evaluationModel.question.value = response.body;
      loading.value = false;
      return response.body;
    } else {
      messageObs.value = response.body['message'];
      loading.value = true;
      return [
        {"message": "Error request"}
      ];
    }
  }

  Future<Response> validerReponse(
      int idQuestion, String reponse, String token) async {
    loading.value = true;
    var response = await _provider.validationReponsePost(
      {
        'id_question': idQuestion,
        'reponse': reponse,
      },
      token,
    );
    if (response.statusCode != null) {
      if (!response.status.hasError) {
        // print(response.body);
        messageObs.value = response.body["message"];
        loading.value = false;
        return response;
      } else {
        // print(response.body);
        messageObs.value = response.body["message"];
        loading.value = false;
        return response;
      }
    } else {
      messageObs.value = "Erreur de connexion au server*";
      loading.value = false;
      return response;
    }
  }

  Future<Response> participeEvaluation(
      int idEvent, int idDepartement, int note, String token) async {
    loading.value = true;
    var response = await _provider.participeEvaluationPost(
      {'id_event': idEvent, 'id_departement': idDepartement, 'note': note},
      token,
    );
    if (response.statusCode != null) {
      if (!response.status.hasError) {
        // print(response.body);
        // messageObs.value = response.body["message"];
        loading.value = false;
        return response;
      } else {
        // print(response.body);
        // messageObs.value = response.body["message"];
        loading.value = false;
        return response;
      }
    } else {
      messageObs.value = "Erreur de connexion au server*";
      loading.value = false;
      return response;
    }
  }

  Future<List> verificationParticipation(
      String token, int idEvent) async {
    loading.value = true;
    //  final HomeProvider provider = HomeProvider();
    var response = await _provider.VerificationParticipation(token, idEvent);
    if (response.statusCode != null) {
      if (!response.status.hasError) {
        evaluationModel.participation.value = [response.body];
        messageObs.value = response.body['message'];
        loading.value = false;
        return [response.body];
      } else {
        evaluationModel.participation.value = [response.body];
        messageObs.value = response.body['message'];
        loading.value = true;
        return [response.body];
      }
    } else {
      messageObs.value = "Error request";
      return [
        {"message": "Error request"}
      ];
    }
  }

  Future<List<dynamic>> suivisUsers(String token) async {
    loading.value = true;
    //  final HomeProvider provider = HomeProvider();
    var response = await _provider.suivisEvaluation(token);
    print('*********************************');
    print(response.body);
    if (!response.status.hasError) {
      statistiqueModel.suivis.value = response.body;
      loading.value = false;
      return response.body;
    } else {
      // messageObs.value = response.body['message'];
      loading.value = true;
      return [
        {"message": "Error request"}
      ];
    }
  }

  Future<List<dynamic>> generaleSuivis(String token, int idUser) async {
    loading.value = true;
    //  final HomeProvider provider = HomeProvider();
    var response = await _provider.generaleSuivis(token, idUser);
    print('*********************************');
    print(response.body);
    if (!response.status.hasError) {
      statistiqueModel.suivisGenerale.value = response.body;
      loading.value = false;
      return response.body;
    } else {
      // messageObs.value = response.body['message'];
      loading.value = true;
      return [
        {"message": "Error request"}
      ];
    }
  }
  

}
