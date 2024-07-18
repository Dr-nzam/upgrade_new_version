import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final Color colorButton;
  final Color colorText;
  final String text;
  final VoidCallback? onPressed;
  final double border;

  const ButtonWidget({
    Key? key,
    this.colorButton = Colors.blue,
    required this.text,
    this.colorText = Colors.white,
    this.onPressed,
    this.border = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*0.070,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorButton),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(border)))),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.nunitoSans(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
