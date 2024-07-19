import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListeNomWidget extends StatelessWidget {
  final String? nom;
  final String? departement;
  final int? note;
final VoidCallback? onPressed;
  const ListeNomWidget(
      {super.key,
      required this.nom,
      required this.departement,
      required this.note,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.person_outline),
            Column(
              children: [
                Text(
                  nom!,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                Text(
                  departement!,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    color: Color(0xFF9E9E9E),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "Derniere evaluation",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 13),
                ),
                Text(
                  "$note",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
