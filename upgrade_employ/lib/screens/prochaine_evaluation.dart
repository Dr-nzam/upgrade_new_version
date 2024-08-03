import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/historique_widget.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class ProchaineEvaluation extends StatefulWidget {
  const ProchaineEvaluation({super.key});

  @override
  State<ProchaineEvaluation> createState() => _ProchaineEvaluationState();
}

class _ProchaineEvaluationState extends State<ProchaineEvaluation> {
  final EvaluationController controller = EvaluationController();
  UserModel user = Get.find();
  EvaluationModel evaluationModel = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void first() async {
      await controller.evaluationFuture(user.token['token']);
    }

    first();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Evaluation à venir",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            await controller.evaluationFuture(user.token['token']);
          },
          child: controller.loading.value == true
              ? Center(
                  child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.blue,
                ))
              : Container(
                  // height: MediaQuery.of(context).size.height * 0.18,
                  child: ListView.builder(
                    itemCount: evaluationModel.donnees.length,
                    itemBuilder: (context, index) {
                      return HistoriqueWidget(
                        date: evaluationModel.donnees[index]['dateDebut'] ??
                            'Date non disponible',
                        nombreParticipant: 12,
                        prochain: evaluationModel.donnees[index]['nom'] ??
                            'Date non disponible',
                        onPressed: () => Get.toNamed(AppRoute.detailEvaluation,
                            arguments: {
                              "detailEvent": evaluationModel.donnees[index],
                              "id":1
                            }),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
