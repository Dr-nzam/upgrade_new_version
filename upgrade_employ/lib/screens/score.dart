import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';
import 'package:upgrade_employ/data/model.dart';

class Score extends StatefulWidget {
  const Score({super.key});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  EvaluationController controller = EvaluationController();
  UserModel user = Get.find();
  @override
  Widget build(BuildContext context) {
    int nombreQuestion = Get.arguments['nombre_question'];
    int bonneReponse = Get.arguments['bonne_reponse'];
    int idEvent = Get.arguments['id_event'];
    int idDepartement = Get.arguments['id_departement'];
    void first() async {
      int note = bonneReponse * 2;
      await controller.participeEvaluation(
          idEvent, idDepartement, note, user.token['token']);
    }
    first();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Reponse",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Votre score est: ",
              style: GoogleFonts.inter(fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              child: Text(
                '${bonneReponse * 2}/${nombreQuestion * 2}',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              radius: 50,
            ),
          ],
        ),
      ),
    );
  }
}
