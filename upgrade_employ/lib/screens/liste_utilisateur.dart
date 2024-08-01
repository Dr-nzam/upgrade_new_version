import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/form_widget/form_widget_sans_icon.dart';
import 'package:upgrade_employ/component/liste_nom_widget.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class ListeUtilisateur extends StatefulWidget {
  const ListeUtilisateur({super.key});

  @override
  State<ListeUtilisateur> createState() => _ListeUtilisateurState();
}

class _ListeUtilisateurState extends State<ListeUtilisateur> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Liste des utilisateurs",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.offNamed(AppRoute.core),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 25),
        children: [
          FormWidgetSansIcon(
            controller: searchController,
            prefixicon: Icon(
              Icons.search,
              size: 35,
            ),
            border: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          ListeNomWidget(
            nom: "pierre adams",
            departement: "HSE",
            note: 18,
            onPressed: () => Get.toNamed(AppRoute.detailUtilisateur),
          ),
          const SizedBox(
            height: 10,
          ),
          ListeNomWidget(
            nom: "Thomas Edimo",
            departement: "INFORMATIQUE",
            note: 10,
            onPressed: () => Get.toNamed(AppRoute.detailUtilisateur),
          ),
          const SizedBox(
            height: 10,
          ),
          ListeNomWidget(
            nom: "Burrelle kenfack",
            departement: "INFORMATIQUE",
            note: 3,
            onPressed: () => Get.toNamed(AppRoute.detailUtilisateur),
          ),
        ],
      ),
    );
  }
}
