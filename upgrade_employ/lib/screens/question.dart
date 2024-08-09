import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Question",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "C'est quoi un pilote informatique?",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
