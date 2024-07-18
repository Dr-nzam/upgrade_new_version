import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/historique.dart';

class ProchaineEvaluation extends StatefulWidget {
  const ProchaineEvaluation({super.key});

  @override
  State<ProchaineEvaluation> createState() => _ProchaineEvaluationState();
}

class _ProchaineEvaluationState extends State<ProchaineEvaluation> {
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
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        children: [
          HistoriqueWidget(
            date: "12/7/2024",
            prochain: "HSE",
          ),
          HistoriqueWidget(
            date: "12/7/2024",
            prochain: "COMPETANCE",
          ),
          HistoriqueWidget(
            date: "12/7/2024",
            prochain: "DISCIPLINE",
          ),
        ],
      ),
    );
  }
}
