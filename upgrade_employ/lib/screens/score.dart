import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Score extends StatefulWidget {
  const Score({super.key});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Reponse",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Votre score est: "),
            Text('14/20'),
          ],
        ),
      ),
    );
  }
}
