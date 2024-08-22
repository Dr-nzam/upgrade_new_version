import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/data/secure_stokage.dart';

class DetailUtilisateur extends StatefulWidget {
  const DetailUtilisateur({super.key});

  @override
  State<DetailUtilisateur> createState() => _DetailUtilisateurState();
}

class _DetailUtilisateurState extends State<DetailUtilisateur> {
  var infouser;
  final SecureStorage secureStorage = SecureStorage();
  EvaluationController controller = EvaluationController();
  UserModel user = Get.find();
  List<List<String>> statistique = [];
  EvaluationModel evaluationModel = Get.find();
  StatistiqueModel stat = Get.find();
  var reponse;
  void first() async {
    reponse = await controller.generaleSuivis(user.token['token'], infouser['id']);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      infouser = Get.arguments['user'];
      first();
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // reponse = await controller.generaleSuivis(user.token['token'], infouser['id']);
      for (var evaluation in stat.suivisGenerale) {
      var dateDebut = evaluation['evaluation']['dateDebut'];
      var nomEvaluation = evaluation['evaluation']['nom'];
      var note = evaluation['note'].toString();
      var deparement = evaluation['departement']['nomDepartement'];

      statistique.add([dateDebut, nomEvaluation, note, deparement]);
    }
    });
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Statistique-Utilistaeur",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 25, right: 15),
            child: Text(
              'Tableau recaputilatif des evaluations de ${infouser['first_name'] ?? ""} ${infouser['last_name'] ?? ""}',
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
          Expanded(
            child: ScrollableTableView(
              headers: [
                "Date evaluation",
                "nom evaluation",
                "note",
                "departement",
              ].map((label) {
                return TableViewHeader(
                  label: label,
                );
              }).toList(),
              rows: statistique.map((record) {
                return TableViewRow(
                  height: 60,
                  cells: record.map((value) {
                    return TableViewCell(
                      child: Text(value),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
