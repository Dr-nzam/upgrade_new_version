import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormWidget extends StatelessWidget {
  final bool isPassword;
  final IconButton prefixicon;
  final IconButton suffixIcon;
  final Color? couleurCurseur;
  final int sizeForm;
  final String? placeholder;
  final String? plein;
  final String? errorMessage;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  FormWidget({
    Key? key,
    this.isPassword = false,
    this.placeholder = '',
    this.plein = '',
    this.sizeForm = 1,
    this.couleurCurseur = Colors.blue,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixicon = const IconButton(
      icon: Icon(null),
      onPressed: null,
      color: Colors.white24,
    ),
    this.suffixIcon = const IconButton(
      icon: Icon(null),
      onPressed: null,
      color: Colors.white24,
    ),
    this.errorMessage = 'Veuillez remplir ce champ.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      maxLines: sizeForm,
      obscureText: isPassword,
      obscuringCharacter: '*',
      controller: controller,
      cursorColor: couleurCurseur,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        suffixIcon: suffixIcon,
        prefixIcon: prefixicon,
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF9A9A9A),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: couleurCurseur!,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff544F4D),
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onChanged: (value) {
        // Handle changes to the text field's value
      },
    );
  }
}
