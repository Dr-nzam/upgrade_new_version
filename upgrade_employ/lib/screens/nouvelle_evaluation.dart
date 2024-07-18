import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/buttom_widget/buttom_widget.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/form_widget/form_widget_sans_icon.dart';
import 'package:intl/intl.dart';

class NouvelleEvaluation extends StatefulWidget {
  const NouvelleEvaluation({super.key});

  @override
  State<NouvelleEvaluation> createState() => _NouvelleEvaluationState();
}

class _NouvelleEvaluationState extends State<NouvelleEvaluation> {
  TextEditingController nomEvaluationController = TextEditingController();
  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController heureDebutController = TextEditingController();
  TextEditingController heureFinController = TextEditingController();
  TextEditingController departementController = TextEditingController();
  final keyform = GlobalKey<FormState>();
  int? boutton;

  String? _selectedItem;
  List<String> _items = [
    'TRACKING',
    'PROJECT-DEVELOPPEMENT',
    'AUTOMATE-DESINGN',
    'INFORMATIQUE',
    'TOUT'
  ];

  @override
  Widget build(BuildContext context) {
    DateTime yearnow = DateTime.now();
    int currentYear = yearnow.year;
    int finalYear = currentYear + 1;
    Future selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(finalYear),
      );

      if (picked != null) {
        setState(() {
          if (boutton! == 0) {
            dateDebutController.text = DateFormat('dd/M/yyyy').format(picked);
          } else if (boutton! == 1) {
            dateFinController.text = DateFormat('dd/M/yyyy').format(picked);
          }
        });
      }
    }

    Future<void> selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        setState(() {
          if (boutton == 0) {
            heureDebutController.text = picked.format(context);
          } else if (boutton == 1) {
            heureFinController.text = picked.format(context);
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Nouvelle Evaluation",
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
        child: Form(
          key: keyform,
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
                        image:
                            AssetImage("${Constante.imagePath}Excellence.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Programmer une evaluation",
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
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
                          onTap: () {
                            setState(() async {
                              boutton = 0;
                              await selectDate(context);
                              boutton = 3;
                            });
                          },
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
                          onTap: () {
                            setState(() async {
                              boutton = 0;
                              await selectTime(context);
                              boutton = 3;
                            });
                          },
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
                          onTap: () {
                            setState(() async {
                              boutton = 1;
                              await selectDate(context);
                              boutton = 3;
                            });
                          },
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
                          onTap: () {
                            setState(() async {
                              boutton = 1;
                              await selectTime(context);
                              boutton = 3;
                            });
                          },
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 28.0, 40),
                        title: Text(
                          'Departement concerner',
                          style: GoogleFonts.inter(fontSize: 15),
                        ),
                        content: DropdownButtonFormField<String>(
                          // padding: EdgeInsetsDirectional.only(end: 2),
                          // iconSize: 10,
                          value: _selectedItem,
                          items: _items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? selectedItem) {
                            setState(() {
                              _selectedItem = selectedItem;
                            });
                            departementController.text = selectedItem ?? '';
                            Navigator.of(context).pop();
                          },
                          decoration: InputDecoration(
                            
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              ButtonWidget(
                text: "Programmer l'évaluation",
                border: 10,
                onPressed: () {
                  print("toto");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
