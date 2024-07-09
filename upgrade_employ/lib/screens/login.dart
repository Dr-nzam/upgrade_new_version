import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/buttom_widget/buttom_widget.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/form_widget/form_widget.dart';
import 'package:flashtoast/flash_toast.dart';
import 'package:upgrade_employ/controller/authentification_controller.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthentificationController controller = AuthentificationController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final keyform = GlobalKey<FormState>();
  bool ispass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: 15.0, left: 15.0),
          child: Form(
            key: keyform,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  '${Constante.imagePath}login.png',
                  height: 300,
                ),
                FormWidget(
                  controller: emailController,
                  placeholder: "Email",
                  prefixicon:
                      IconButton(onPressed: null, icon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 15,
                ),
                FormWidget(
                  controller: passwordController,
                  placeholder: "password",
                  isPassword: ispass,
                  prefixicon:
                      IconButton(onPressed: null, icon: Icon(Icons.lock)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispass = !ispass;
                      });
                    },
                    icon: ispass
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonWidget(
                  text: "Connexion",
                  onPressed: () async {
                    if (keyform.currentState!.validate()) {
                      Response response = await controller.loginUserPost(
                          emailController.text, passwordController.text);
                      if (response.statusCode == 200) {
                        print("tout c'est bien passe");
                        Get.offAllNamed(AppRoute.core);
                      } else {
                        FlashToast.showFlashToast(
                          context: context,
                          title: "Erreur de connexion.",
                          message: "Mot de passe ou email incorrect.",
                          duration: 4,
                          flashType: FlashType.error,
                        );
                      }
                    } else {
                      FlashToast.showFlashToast(
                        context: context,
                        title: "Saisir incomplete",
                        message: "Veillez remplir tout les champs",
                        duration: 3,
                        flashType: FlashType.error,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Text(" Ou "),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    FlashToast.showFlashToast(
                      context: context,
                      title: "Autorisation",
                      message:
                          "veillez rencontrer votre RH pour avoir un compte.",
                      duration: 4,
                      flashType: FlashType.help,
                    );
                  },
                  child: Center(
                    child: Text(
                      "Je n'ai pas de compte",
                      style: GoogleFonts.inter(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
