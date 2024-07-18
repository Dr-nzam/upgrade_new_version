import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/form_widget/form_widget_sans_icon.dart';

class DetailEvaluation extends StatefulWidget {
  const DetailEvaluation({super.key});

  @override
  State<DetailEvaluation> createState() => _DetailEvaluationState();
}

class _DetailEvaluationState extends State<DetailEvaluation> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nomEvaluationController =
        TextEditingController(text: "Evaluation HSE");
    final TextEditingController dateDebutController =
        TextEditingController(text: "12/7/2024");
    final TextEditingController heureDebutController =
        TextEditingController(text: "10:00");
    final TextEditingController dateFinController =
        TextEditingController(text: "12/7/2024");
    final TextEditingController heureFinController =
        TextEditingController(text: "10:50");
    final TextEditingController departementController =
        TextEditingController(text: "INFORMATIQUE");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Détails Evaluation",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${Constante.imagePath}detail.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Nom de l'évaluation",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              controller: nomEvaluationController,
              placeholder: 'HSE',
              keyboardType: TextInputType.none,
              prefixicon: Icon(
                Icons.text_fields_outlined,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date de debut",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: FormWidgetSansIcon(
                        placeholder: '13/7/2024',
                        controller: dateDebutController,
                        keyboardType: TextInputType.none,
                        prefixicon: Icon(
                          Icons.date_range_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Heure de debut",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: FormWidgetSansIcon(
                        placeholder: '10:00',
                        controller: heureDebutController,
                        keyboardType: TextInputType.none,
                        prefixicon: Icon(
                          Icons.watch_later_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date de fin",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: FormWidgetSansIcon(
                        placeholder: '13/07/2024',
                        controller: dateFinController,
                        keyboardType: TextInputType.none,
                        prefixicon: Icon(
                          Icons.date_range_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Heure de fin",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: FormWidgetSansIcon(
                        placeholder: '10:30',
                        controller: heureFinController,
                        keyboardType: TextInputType.none,
                        prefixicon: Icon(
                          Icons.watch_later_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Departement",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              placeholder: 'INFORMATIQUE',
              keyboardType: TextInputType.none,
              controller: departementController,
              prefixicon: Icon(
                Icons.desktop_mac_outlined,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
