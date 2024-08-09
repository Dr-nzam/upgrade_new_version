import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/drawer_widget.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:upgrade_employ/screens/historique.dart';
import 'package:upgrade_employ/screens/home.dart';
import 'package:upgrade_employ/screens/parametre.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  int _selectedIndex = 0;
  // bool test = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color selectCouleur = const Color(0xFF5669FF);
  Color unselectCouleur = const Color(0xFFA0A0A0);
  UserModel user = Get.find();
  @override
  Widget build(BuildContext context) {
    List page = [
      Home(),
      Historique(),
      Parametre(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Up-Grade",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: user.donnees[0]["is_admin"] == true?true:false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      
      drawer: user.donnees[0]["is_admin"] == true? DrawerWidget():null,
      body: Container(
        child: page.elementAt(_selectedIndex),
      ),
      floatingActionButton: user.donnees[0]["is_admin"] == true?FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.nouvelleVersion);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        mini: true,
      ):null,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: selectCouleur,
        selectedIconTheme: const IconThemeData(
          color: Color(0xFF5669FF),
        ),
        unselectedItemColor: unselectCouleur,
        selectedFontSize: 20,
        currentIndex: _selectedIndex,
        unselectedFontSize: 20,
        onTap: _onItemTapped,
        selectedLabelStyle:
            GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                size: 40,
              )),
          BottomNavigationBarItem(
              label: 'Historique',
              icon: Icon(
                Icons.history,
                size: 40,
              )),
          BottomNavigationBarItem(
              label: 'Paramètre',
              icon: Icon(
                Icons.settings,
                size: 40,
              )),
        ],
      ),
    );
  }
}
