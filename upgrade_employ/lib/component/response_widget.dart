import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ReponseWidget extends StatelessWidget {
  String? lettreReponse;
  String? reponse;
  Color? couleur;
  VoidCallback? onTap;

  ReponseWidget(
      {super.key,
      required this.lettreReponse,
      required this.reponse,
      this.couleur,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        // runAlignment: WrapAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10,),
          Container(
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: couleur,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                children: [
                  Text(
                    "$lettreReponse.",
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "$reponse",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
