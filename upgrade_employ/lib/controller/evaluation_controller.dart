import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/data/secure_stokage.dart';
import 'package:upgrade_employ/network/evaluation_service.dart';


class EvaluationController extends GetxController {
  String messageObs = ''.obs.value;
  bool loading = false.obs.value;

  final EvaluationServiceProvider _provider = EvaluationServiceProvider();

  Future<Response> ajouterEvaluation(
      String nom,
      String dateDebut,
      String dateFin,
      String heureDebut,
      String heureFin,
      int departement,
      String token) async {
    loading = true;
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
        // print('User registered');
        messageObs = response.body["message"];
        loading = false;
        return response;
      } else {
        messageObs = response.body["message"];
        print(response.body);
        loading = false;
        return response;
      }
    } else {
      messageObs = "Erreur de connexion au server*";
      loading = false;
      return response;
    }
  }
}
