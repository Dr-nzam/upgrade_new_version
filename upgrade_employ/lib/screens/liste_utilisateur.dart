import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/form_widget/form_widget_sans_icon.dart';
import 'package:upgrade_employ/component/liste_nom_widget.dart';
import 'package:upgrade_employ/controller/authentification_controller.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class ListeUtilisateur extends StatefulWidget {
  const ListeUtilisateur({super.key});

  @override
  State<ListeUtilisateur> createState() => _ListeUtilisateurState();
}

class _ListeUtilisateurState extends State<ListeUtilisateur> {
  TextEditingController searchController = TextEditingController();
  AuthentificationController controller = AuthentificationController();
  UserModel user = Get.find();
  var seachValeur = '';
  @override
  Widget build(BuildContext context) {
    // frist();
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
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.listUser(user.token['token']);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: FormWidgetSansIcon(
                 callback: (search) {
              setState(() {
                seachValeur = search;
                controller.listUser(user.token['token'], search: search);
                // RechercheEvent(seach);
              });
            },  
              controller: searchController,
                prefixicon: Icon(
                  Icons.search,
                  size: 35,
                ),
                border: 50,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              // height: 200,
              child: ListView.builder(
                itemCount: user.listUser[0].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                    child: ListeNomWidget(
                      nom: "${user.listUser[0][index]["last_name"]}",
                      departement: "HSE",
                      note: 18,
                      onPressed: () => Get.toNamed(AppRoute.detailUtilisateur),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
