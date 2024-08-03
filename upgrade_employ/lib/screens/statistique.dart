import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class Statistique extends StatefulWidget {
  const Statistique({super.key});

  @override
  State<Statistique> createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {
  List<List<String>> statistique = [];
  @override
  Widget build(BuildContext context) {
    var dataStatistique = Get.arguments['statistique'];

    for (var evaluation in dataStatistique) {
      for (var participation in evaluation['participations']) {
        var dateDebut = participation['evaluation']['dateDebut'];
        var petiteNote = evaluation['petite_note'].toString();
        var moyenne = evaluation['moyenne'].toString();
        var premiereNote = evaluation['premiereNote'].toString();

        statistique.add([dateDebut, petiteNote, moyenne, premiereNote]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Statistique",
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
      body: ScrollableTableView(
        headers: [
          "Date",
          "petite note",
          "moyenne",
          "prémiere note",
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
    );
  }
}
