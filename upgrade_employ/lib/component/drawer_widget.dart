import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 96.5),
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 216, 213, 213),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () => Get.toNamed(AppRoute.addUser),
              leading: const Icon(Icons.person_add),
              selectedColor: Colors.blue,
              // selected: true,
              title: Text(
                "Ajouter un utilisateur",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            
            ListTile(
              onTap: () => Get.toNamed(AppRoute.listeUtilisateur),
              leading: const Icon(Icons.group),
              title: Text(
                "Liste du personnel",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
