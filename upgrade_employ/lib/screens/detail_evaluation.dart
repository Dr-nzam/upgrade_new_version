import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/buttom_widget/buttom_widget.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/form_widget/form_widget_sans_icon.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:intl/intl.dart';

class DetailEvaluation extends StatefulWidget {
  const DetailEvaluation({super.key});

  @override
  State<DetailEvaluation> createState() => _DetailEvaluationState();
}

class _DetailEvaluationState extends State<DetailEvaluation> {
  DepartementModel departementModel = Get.find();
  EvaluationController controller = EvaluationController();
  UserModel user = Get.find();
  // ignore: prefer_typing_uninitialized_variables
  var departementlist;
  String? departementnom;
  int? idDepartement;
  bool isValid = false;
  bool isParticipation = false;
  @override
  void initState() {
    super.initState();
    void first() async {
      await controller.allDepartement(user.token['token']);
      await controller.question(user.token['token']);
      var detail = Get.arguments['detailEvent'];
      var response = await controller.verificationParticipation(
          user.token['token'], detail['id']);
      if (response[0]['message'] == "Vous n'avez pas participez") {
        isParticipation = true;
      }
    }

    first();
  }

  @override
  Widget build(BuildContext context) {
    var detail = Get.arguments['detailEvent'];
    var id = Get.arguments['id'];

    if (id == 1) {
      for (departementlist in departementModel.donnees) {
        if (departementlist['id'] == detail['departement']) {
          departementnom = departementlist['nomDepartement'];
        }
      }
    } else {
      for (departementlist in departementModel.donnees) {
        if (departementlist['id'] == detail['departement']) {
          departementnom = departementlist['nomDepartement'];
        }
      }
    }
    final TextEditingController nomEvaluationController =
        TextEditingController(text: "${detail['nom']}");
    final TextEditingController dateDebutController =
        TextEditingController(text: "${detail['dateDebut']}");
    final TextEditingController heureDebutController =
        TextEditingController(text: "${detail['heureDebut']}");
    final TextEditingController dateFinController =
        TextEditingController(text: "${detail['dateFin']}");
    final TextEditingController heureFinController =
        TextEditingController(text: "${detail['heureFin']}");
    final TextEditingController departementController =
        TextEditingController(text: "$departementnom");

    DateTime now = DateTime.now();
    String dateNow = DateFormat('dd/M/yyyy').format(DateTime.now());
    String heure = "${now.hour}:${now.minute}";
    List<String> parts = heure.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    TimeOfDay heureActuelle = TimeOfDay(hour: hour, minute: minute);
    TimeOfDay heureDebut = TimeOfDay(
        hour: int.parse(detail['heureDebut'].split(':')[0]),
        minute: int.parse(detail['heureDebut'].split(':')[1]));
    TimeOfDay heureFin = TimeOfDay(
        hour: int.parse(detail['heureFin'].split(':')[0]),
        minute: int.parse(detail['heureFin'].split(':')[1]));

    if ((heureActuelle.hour > heureDebut.hour ||
            (heureActuelle.hour == heureDebut.hour &&
                heureActuelle.minute >= heureDebut.minute)) &&
        (heureActuelle.hour < heureFin.hour ||
            (heureActuelle.hour == heureFin.hour &&
                heureActuelle.minute <= heureFin.minute))) {
      isValid = true;
    } else {
      print("fermer");
    }
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${Constante.imagePath}detail.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Nom de l'évaluation",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              controller: nomEvaluationController,
              placeholder: 'HSE',
              keyboardType: TextInputType.none,
              prefixicon: const Icon(
                Icons.text_fields_outlined,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
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
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: FormWidgetSansIcon(
                        placeholder: '13/7/2024',
                        controller: dateDebutController,
                        keyboardType: TextInputType.none,
                        prefixicon: const Icon(
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
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: FormWidgetSansIcon(
                        placeholder: '10:00',
                        controller: heureDebutController,
                        keyboardType: TextInputType.none,
                        prefixicon: const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
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
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: FormWidgetSansIcon(
                        placeholder: '13/07/2024',
                        controller: dateFinController,
                        keyboardType: TextInputType.none,
                        prefixicon: const Icon(
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
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: FormWidgetSansIcon(
                        placeholder: '10:30',
                        controller: heureFinController,
                        keyboardType: TextInputType.none,
                        prefixicon: const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Departement",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              placeholder: 'INFORMATIQUE',
              keyboardType: TextInputType.none,
              controller: departementController,
              prefixicon: const Icon(
                Icons.desktop_mac_outlined,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            id == 1 &&
                    dateNow == dateDebutController.text &&
                    isValid &&
                    isParticipation
                ? ButtonWidget(
                    text: "Commencer",
                    onPressed: () {
                      Get.offNamed(AppRoute.question, arguments: {
                        "id_event": detail['id'],
                        "id_departement": departementlist['id']
                      });
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
