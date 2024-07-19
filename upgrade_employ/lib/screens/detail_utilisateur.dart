import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class DetailUtilisateur extends StatefulWidget {
  const DetailUtilisateur({super.key});

  @override
  State<DetailUtilisateur> createState() => _DetailUtilisateurState();
}

class _DetailUtilisateurState extends State<DetailUtilisateur> {
  @override
  Widget build(BuildContext context) {
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
          icon: Icon(
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
            padding: EdgeInsets.only(left: 15, top: 25, right: 15),
            child: Text("Tableau recaputilatif des evaluations de jonh Doe", style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w300),),
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
              rows: [
                [
                  "12/7/2024",
                  "HSE",
                  "15/20",
                  "INFORMATIQUE",
                ],
                [
                  "10/4/2023",
                  "COMPETANCE",
                  "13/20",
                  "TRACKING",
                ],
              ].map((record) {
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
