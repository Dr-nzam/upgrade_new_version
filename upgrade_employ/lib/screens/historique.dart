import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/historique.dart';

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Text(
              "Historique des évaluations",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            HistoriqueWidget(
              date: "03/04/2024",
              nombreParticipant: 12,
              prochain: "HSE",
            ),
            HistoriqueWidget(
              date: "10/06/2024",
              nombreParticipant: 12,
              prochain: "Compétance",
            ),
            HistoriqueWidget(
              date: "12/07/2024",
              nombreParticipant: 12,
              prochain: "Discipline",
            ),
          ],
        ),
      ),
    );
  }
}
