import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        // automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 216, 213, 213),
          child: Padding(
            padding: EdgeInsets.only(top: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: ()=> Get.toNamed(AppRoute.addUser),
                  leading: Icon(Icons.person_add),
                  selectedColor: Colors.blue,
                  // selected: true,
                  title: Text(
                    "Ajouter un utilisateur",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text(
                    "Historique des evaluation",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.group),
                  title: Text(
                    "Liste du personnel",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        child: page.elementAt(_selectedIndex),
      ),
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
