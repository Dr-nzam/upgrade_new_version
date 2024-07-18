import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/buttom_widget/buttom_widget.dart';
import 'package:upgrade_employ/component/form_widget/form_widget.dart';

class ChangerMotDePasse extends StatefulWidget {
  const ChangerMotDePasse({super.key});

  @override
  State<ChangerMotDePasse> createState() => _ChangerMotDePasseState();
}

class _ChangerMotDePasseState extends State<ChangerMotDePasse> {
  final TextEditingController ancienPassController = TextEditingController();
  final TextEditingController nouveauPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool ispass = true;
  bool nispass = true;
  bool cispass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Changer le mot de passe",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        children: [
          Text(
            "Anciens  mot de passe ",
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          FormWidget(
            border: 10,
            controller: ancienPassController,
            placeholder: '****************',
            prefixicon: IconButton(onPressed: null, icon: Icon(Icons.lock)),
            isPassword: ispass,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  ispass = !ispass;
                });
              },
              icon:
                  ispass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Nouveau mot de passe​ ",
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          FormWidget(
            border: 10,
            controller: nouveauPassController,
            placeholder: '****************',
            prefixicon: IconButton(
              onPressed: null,
              icon: Icon(Icons.lock),
            ),
            isPassword: nispass,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  nispass = !nispass;
                });
              },
              icon:
                  nispass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Confirmer le  mot de passe",
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          FormWidget(
            border: 10,
            isPassword: cispass,
            controller: confirmPassController,
            placeholder: '****************',
            prefixicon: IconButton(
              onPressed: null,
              icon: Icon(Icons.lock),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  cispass = !cispass;
                });
              },
              icon:
                  cispass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          ButtonWidget(
            text: "Changer le mot de passe",
            border: 10,
            onPressed: () {
              print("toto");
            },
          )
        ],
      ),
    );
  }
}
