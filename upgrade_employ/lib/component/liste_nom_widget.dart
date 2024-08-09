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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(backgroundColor: Colors.blue,child: Icon(Icons.person_outline, color: Colors.white,),),
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
                  color: const Color(0xFF9E9E9E),
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
                  color: const Color(0xFF9E9E9E),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
