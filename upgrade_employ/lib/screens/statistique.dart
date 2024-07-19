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
  @override
  Widget build(BuildContext context) {
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
        rows: [
          ["12/7/2024", "12", "15","18",],
          ["10/4/2023", "11", "13","16",],
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
    );
  }
}