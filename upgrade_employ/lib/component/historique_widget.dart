import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoriqueWidget extends StatelessWidget {
  String? date;
  int? nombreParticipant;
  String? prochain;
  final VoidCallback? onPressed;
  HistoriqueWidget(
      {super.key,
      required this.date,
      this.nombreParticipant = 1,
      this.prochain = "", 
      this.onPressed
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      leading: const Icon(
        Icons.book,
        size: 30,
      ),
      title: Text(
        date!,
        style: GoogleFonts.inter(fontSize: 20),
      ),
      subtitle: prochain != ""
          ? Text(
              "L'évaluation $prochain",
              style: GoogleFonts.inter(),
            )
          : nombreParticipant == 1
              ? Text(
                  "Nombre de participant $nombreParticipant",
                  style: GoogleFonts.inter(),
                )
              : Text(
                  "Nombre de participants $nombreParticipant",
                  style: GoogleFonts.inter(),
                ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 30,
        color: Colors.blue,
      ),
      onTap: onPressed,
    );
    
  }
}
