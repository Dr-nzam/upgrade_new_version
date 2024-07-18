import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stat extends StatefulWidget {
  final String? date;
  final double? petiteNote;
  final double? grandeNote;
  final double? premiereNote;
  final double? moyenne;

  const Stat(
      {super.key,
      this.date,
      this.petiteNote,
      this.moyenne,
      this.grandeNote,
      this.premiereNote});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                  'Date',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800, fontSize: 10),
                ),
                Text(
                  "petite note",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800, fontSize: 10),
                ),
                Text(
                  "moyenne",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800, fontSize: 10),
                ),
                Text(
                  "prémière note",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800, fontSize: 10),
                ),
           
            
           
          ],
        ),
      ],
    );
  }
}
