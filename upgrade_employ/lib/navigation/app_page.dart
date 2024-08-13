
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
import 'package:upgrade_employ/screens/score.dart';
import 'package:upgrade_employ/screens/splash.dart';
import 'package:upgrade_employ/screens/statistique.dart';

class AppPage{
  static  List<GetPage> page =[
    GetPage(name: AppRoute.splash, page: ()=> Splash(), binding: SplashBinding()),
    GetPage(name: AppRoute.login, page: ()=>const Login()),
    GetPage(name: AppRoute.core, page: ()=>const Core()),
    GetPage(name: AppRoute.addUser, page: ()=>const AddUser(), binding: AuthentificationBinding()),
    GetPage(name: AppRoute.home, page: ()=>const Home(), binding:EvaluationBinding()),
    GetPage(name: AppRoute.home, page: ()=>const Historique(), binding:EvaluationBinding()),
    GetPage(name: AppRoute.nouvelleVersion, page: ()=>const NouvelleEvaluation(), binding: EvaluationBinding()),
    GetPage(name: AppRoute.changePassword, page: ()=>const ChangerMotDePasse(), binding: AuthentificationBinding()),
    GetPage(name: AppRoute.prochaineEvaluation, page: ()=>const ProchaineEvaluation()),
    GetPage(name: AppRoute.detailEvaluation, page: ()=>const DetailEvaluation(), binding: EvaluationBinding()),
    GetPage(name: AppRoute.statistique, page: ()=>const Statistique()),
    GetPage(name: AppRoute.listeUtilisateur, page: ()=>const ListeUtilisateur(),binding: AuthentificationBinding()),
    GetPage(name: AppRoute.detailUtilisateur, page: ()=>const DetailUtilisateur()),
    GetPage(name: AppRoute.question, page: ()=>const Question()),
    GetPage(name: AppRoute.score, page: ()=>const Score()),
  ];
}