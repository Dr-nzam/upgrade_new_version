import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/buttom_widget/buttom_widget.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/form_widget/form_widget.dart';
import 'package:upgrade_employ/component/form_widget/form_widget_sans_icon.dart';
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
  TextEditingController passController = TextEditingController();
  // TextEditingController nomController = TextEditingController();
  bool ispass = true;
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
      body: ListView(
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
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
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
            controller: passController,
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
            onPressed: () {
              print("toto");
            },
          ),
        ],
      ),
    );
  }
}
