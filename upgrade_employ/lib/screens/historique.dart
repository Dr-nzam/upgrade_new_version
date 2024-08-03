import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/historique_widget.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  UserModel user = Get.find();
  EvaluationModel evaluationModel = Get.find();
  final EvaluationController controller = EvaluationController();
  void frist() async {
    await controller.historique(user.token['token']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    frist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            await controller.historique(user.token['token']);
          },
          child: controller.loading.value == true
              ? Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.blue,
                  ),
                )
              : ListView.builder(
                  itemCount: evaluationModel.historique.length,
                  itemBuilder: (context, index) {
                    return HistoriqueWidget(
                      date: evaluationModel.historique[index]['dateDebut'] ??
                          'Date non disponible',
                      nombreParticipant: 12,
                      prochain: evaluationModel.historique[index]['nom'] ??
                          'Date non disponible',
                      onPressed: () => Get.toNamed(AppRoute.detailEvaluation,
                          arguments: {
                            "detailEvent": evaluationModel.historique[index],
                            "id": 2
                          }),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
