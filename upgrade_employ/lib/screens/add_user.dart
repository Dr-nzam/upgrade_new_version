import 'package:flashtoast/flash_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/buttom_widget/buttom_widget.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/form_widget/form_widget.dart';
import 'package:upgrade_employ/component/form_widget/form_widget_sans_icon.dart';
import 'package:upgrade_employ/controller/authentification_controller.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController departementController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController nomController = TextEditingController();
  final EvaluationController controller = EvaluationController();
  final AuthentificationController controllerAuth =
      AuthentificationController();
  DepartementModel departementlist = Get.find();
  UserModel user = Get.find();
  bool ispass = true;
  String? _selectedItem;
  List<String> _items = [];
  int? idDepartement;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listDepartement() async {
      var response = await controller.allDepartement(user.token['token']);

      _items = departementlist.donnees.value
          .map((dep) => dep['nomDepartement'] as String)
          .toList();
    }

    listDepartement();
  }

  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Ajouter un utilisateur",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.offNamed(AppRoute.core),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: keyform,
        child: ListView(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 20),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${Constante.imagePath}bienvenue.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ajouter un nouveau employer",
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Nom",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              controller: nomController,
              placeholder: 'Ninke',
              prefixicon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Prenom",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              controller: prenomController,
              placeholder: 'Celina',
              prefixicon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "E-mail",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              controller: emailController,
              placeholder: 'celinaninke@elecit.com',
              prefixicon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tel",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            IntlPhoneField(
              initialCountryCode: 'CM',
              // focusNode: FocusNode,
              controller: telController,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                hintText: "695759731",
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9A9A9A),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                // labelText: 'Phone Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )),
              ),
              languageCode: "fr",
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
            Text(
              "Departement",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            FormWidgetSansIcon(
              controller: departementController,
              keyboardType: TextInputType.none,
              placeholder: 'INFORMATIQUE',
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
              height: 10,
            ),
            Text(
              "Mot de passe",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            FormWidget(
              controller: passwordController,
              border: 10,
              placeholder: '*********',
              isPassword: ispass,
              prefixicon: IconButton(
                onPressed: null,
                icon: Icon(Icons.lock, color: Colors.blue),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    ispass = !ispass;
                  });
                },
                icon: ispass
                    ? Icon(
                        Icons.visibility,
                        color: Colors.blue,
                      )
                    : Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              text: "Ajouter",
              border: 10,
              onPressed: () async {
                if (keyform.currentState!.validate()) {
                  var result = departementlist.donnees.value.firstWhere(
                    (dept) =>
                        dept['nomDepartement'] == departementController.text,
                    orElse: () => {'id': null, 'nomDepartement': 'Non trouvé'},
                  );

                  // Affichage du résultat
                  if (result['id'] != null) {
                    print(
                        'ID du département "${departementController.text}": ${result['id']}');
                    idDepartement = result['id'];
                  } else {
                    print(
                        'Département "${departementController.text}" non trouvé.');
                  }
                  print(passwordController.text);
                  var reponse = await controllerAuth.ajouterUtisateur(
                      nomController.text,
                      prenomController.text,
                      emailController.text,
                      telController.text,
                      idDepartement!,
                      passwordController.text,
                      user.token['token']);
                    print("tot");
                  if (reponse.statusCode == 201) {
                    FlashToast.showFlashToast(
                      context: context,
                      title: "Utilisateur",
                      message: " Utilisateur ajouté avec succèss",
                      duration: 3,
                      flashType: FlashType.success,
                    );
                    nomController.text = '';
                      prenomController.text = '';
                      emailController.text = '';
                      telController.text = ''; 
                      departementController.text = '';
                      passwordController.text = '';

                  }
                  else{
                    FlashToast.showFlashToast(
                      context: context,
                      title: "Error",
                      message: controllerAuth.messageObs,
                      duration: 4,
                      flashType: FlashType.error,
                    );
                    // print("to");
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
