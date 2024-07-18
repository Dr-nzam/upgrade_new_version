import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class Parametre extends StatefulWidget {
  const Parametre({super.key});

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blue,
                            child: Text(
                              'A',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF9E9E9E),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  child: Text(
                    "Mon compte",
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: ()=>Get.toNamed(AppRoute.changePassword),
                leading: Icon(Icons.lock),
                title: Text(
                  "changer votre mot de passe",
                  style: GoogleFonts.inter(),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Support",
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "À propos de Up-Grade",
                  style: GoogleFonts.inter(),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.menu_book),
                title: Text(
                  "Conditions générales",
                  style: GoogleFonts.inter(),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.lock_open),
                title: Text(
                  "Politique de confidentialité",
                  style: GoogleFonts.inter(),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    color: Color(0xFFDBDBE4),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Déconnexion',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffEF5241),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
