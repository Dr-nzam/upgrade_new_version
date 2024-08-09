import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      // runAlignment: WrapAlignment.spaceBetween,
      children: [
        Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              children: [
                Text(
                  "A.",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "voiture volant",
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
