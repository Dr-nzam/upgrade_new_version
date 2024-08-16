import 'dart:math';
import 'package:flashtoast/flash_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/buttom_widget/buttom_widget.dart';
import 'package:upgrade_employ/component/response_widget.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int idcouleur = -1;
  String texte = "";
  int intdex = 0;
  int bonneReponseUser = 0;
  String textBouton = 'Suivant';
  List quest = [];
  List reponseQuest = [];
  EvaluationModel evaluation = Get.find();
  List bonneReponse = [];
  List reponseMelanger = [];
  EvaluationController controller = EvaluationController();
  UserModel user = Get.find();
  int getQuestionId(String questionText) {
    for (var question in evaluation.question) {
      if (question['question'] == questionText) {
        return question['id'];
      }
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < evaluation.question.length; i++) {
      quest.add(evaluation.question[i]['question']);
      reponseQuest.add(
          evaluation.question[i]['reponse'][0]['mauvaiseReponse'].split(','));
      bonneReponse.add(evaluation.question[i]['reponse'][0]['bonneReponse']);
    }
    for (int i = 0; i < evaluation.question.length; i++) {
      reponseQuest[i].add(bonneReponse[i]);
      reponseQuest[i].shuffle(Random());
    }
    print(evaluation.question);
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    int idEvent = Get.arguments['id_event'];
    int idDepartement = Get.arguments['id_departement'];
    // print(reponseQuest);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Question",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        children: [
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quest[intdex],
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (int j = 0; j < reponseQuest[i].length; j++)
                  ReponseWidget(
                    lettreReponse: 'A',
                    reponse: "${reponseQuest[i][j]}",
                    couleur: texte == reponseQuest[i][j]
                        ? Colors.blue
                        : Colors.white,
                    onTap: () {
                      setState(() {
                        idcouleur = 1;
                        texte = reponseQuest[i][j];
                      });
                    },
                  ),
                const SizedBox(
                  height: 15,
                ),
                ButtonWidget(
                  text: textBouton,
                  border: 10,
                  onPressed: () async {
                    int idQuestion = getQuestionId(quest[intdex]);
                    var reponse = await controller.validerReponse(
                        idQuestion, texte, user.token['token']);
                    print("**********************");
                    print(reponse.body);
                    if (reponse.body['message'] == "bonne reponse") {
                      bonneReponseUser = bonneReponseUser + 1;
                    }

                    setState(
                      () {
                        if (idcouleur > 0) {
                          if (intdex < quest.length - 1) {
                            intdex = intdex + 1;
                            print(intdex);
                            i = i + 1;
                            texte = "";
                            idcouleur = -1;
                          } else {
                            Get.offNamed(AppRoute.score, arguments: {
                              "nombre_question": intdex + 1,
                              "bonne_reponse": bonneReponseUser,
                              "id_event": idEvent,
                              "id_departement":idDepartement,
                            });
                          }
                        } else {
                          FlashToast.showFlashToast(
                            context: context,
                            title: "Erreur de choix",
                            message: "Veillez choisir une reponse",
                            duration: 1,
                            flashType: FlashType.error,
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
