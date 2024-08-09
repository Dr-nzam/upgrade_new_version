
import 'package:get/get.dart';
import 'package:upgrade_employ/liaison/authentification_binding.dart';
import 'package:upgrade_employ/liaison/evaluation_binding.dart';
import 'package:upgrade_employ/liaison/splash_binding.dart';
import 'package:upgrade_employ/navigation/app_route.dart';
import 'package:upgrade_employ/screens/add_user.dart';
import 'package:upgrade_employ/screens/changer_mot_de_passe.dart';
import 'package:upgrade_employ/screens/core.dart';
import 'package:upgrade_employ/screens/detail_evaluation.dart';
import 'package:upgrade_employ/screens/detail_utilisateur.dart';
import 'package:upgrade_employ/screens/historique.dart';
import 'package:upgrade_employ/screens/home.dart';
import 'package:upgrade_employ/screens/liste_utilisateur.dart';
import 'package:upgrade_employ/screens/login.dart';
import 'package:upgrade_employ/screens/nouvelle_evaluation.dart';
import 'package:upgrade_employ/screens/prochaine_evaluation.dart';
import 'package:upgrade_employ/screens/question.dart';
import 'package:upgrade_employ/screens/splash.dart';
import 'package:upgrade_employ/screens/statistique.dart';

class AppPage{
  static  List<GetPage> page =[
    GetPage(name: AppRoute.splash, page: ()=> Splash(), binding: SplashBinding()),
    GetPage(name: AppRoute.login, page: ()=>Login()),
    GetPage(name: AppRoute.core, page: ()=>Core()),
    GetPage(name: AppRoute.addUser, page: ()=>AddUser(), binding: AuthentificationBinding()),
    GetPage(name: AppRoute.home, page: ()=>Home(), binding:EvaluationBinding()),
    GetPage(name: AppRoute.home, page: ()=>Historique(), binding:EvaluationBinding()),
    GetPage(name: AppRoute.nouvelleVersion, page: ()=>NouvelleEvaluation(), binding: EvaluationBinding()),
    GetPage(name: AppRoute.changePassword, page: ()=>ChangerMotDePasse(), binding: AuthentificationBinding()),
    GetPage(name: AppRoute.prochaineEvaluation, page: ()=>ProchaineEvaluation()),
    GetPage(name: AppRoute.detailEvaluation, page: ()=>DetailEvaluation(), binding: EvaluationBinding()),
    GetPage(name: AppRoute.statistique, page: ()=>Statistique()),
    GetPage(name: AppRoute.listeUtilisateur, page: ()=>ListeUtilisateur(),binding: AuthentificationBinding()),
    GetPage(name: AppRoute.detailUtilisateur, page: ()=>DetailUtilisateur()),
    GetPage(name: AppRoute.question, page: ()=>Question())
  ];
}