import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/historique_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:upgrade_employ/controller/authentification_controller.dart';
import 'package:upgrade_employ/controller/evaluation_controller.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/navigation/app_route.dart';

final List<String> imgList = [
  '1.png',
  '2.png',
  '3.png',
  '4.png',
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset("${Constante.imagePath}$item",
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: const Text(
                      // 'No. ${imgList.indexOf(item)} image',
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final EvaluationController controller = EvaluationController();
  final AuthentificationController controllerAuth =
      AuthentificationController();
  UserModel user = Get.find();
  EvaluationModel evaluationModel = Get.find();
  StatistiqueModel statistiqueModel = Get.find();
  void first() async {
    await controller.evaluationFuture(user.token['token']);
    await controller.statistique(user.token['token']);
    await controller.allDepartement(user.token['token']);
    await controllerAuth.listUser(user.token['token']);
    await controller.suivisUsers(user.token['token']);
  }

  @override
  void initState() {
    super.initState();
    first();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          await controller.evaluationFuture(user.token['token']);
          await controller.statistique(user.token['token']);
          await controller.suivisUsers(user.token['token']);
        },
        color: Colors.blue,
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            children: [
              Text(
                "Bonjour ${user.donnees[0]["first_name"]}",
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                "Nous somme heureux de vous revoir",
                style: GoogleFonts.inter(
                  color: const Color(0xFF9E9E9E),
                ),
              ),
              const SizedBox(height: 15),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
              const SizedBox(
                height: 10,
              ),
              user.donnees[0]["is_admin"] == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Programmez une évaluation",
                          style: GoogleFonts.inter(),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.nouvelleVersion);
                          },
                          child: Row(
                            children: [
                              Text(
                                "Ajouter",
                                style: GoogleFonts.inter(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800),
                              ),
                              const Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Prochaine évaluations",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: evaluationModel.donnees.isEmpty
                        ? null
                        : () {
                            Get.toNamed(AppRoute.prochaineEvaluation);
                          },
                    child: Text(
                      "Tout voir",
                      style: GoogleFonts.inter(
                          color: Colors.blue, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              controller.loading.value == true
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.blue,
                      ),
                    )
                  : SizedBox(
                      height: evaluationModel.donnees.length <= 1
                          ? MediaQuery.of(context).size.height *
                              0.1 // Hauteur réduite pour une seule donnée
                          : MediaQuery.of(context).size.height * 0.18,
                      child: evaluationModel.donnees.isEmpty
                          ? Center(
                              child: Text(
                                "Vous n'avez aucune evaluation programmé",
                                style: GoogleFonts.inter(),
                              ),
                            )
                          : ListView.builder(
                              itemCount: evaluationModel.donnees.length,
                              itemBuilder: (context, index) {
                                return HistoriqueWidget(
                                  date: evaluationModel.donnees[index]
                                          ['dateDebut'] ??
                                      'Date non disponible',
                                  nombreParticipant: 12,
                                  prochain: evaluationModel.donnees[index]
                                          ['nom'] ??
                                      'Date non disponible',
                                  onPressed: () => Get.toNamed(
                                      AppRoute.detailEvaluation,
                                      arguments: {
                                        "detailEvent":
                                            evaluationModel.donnees[index],
                                        "id": 1
                                      }),
                                );
                              },
                            ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Statistique",
                    style: GoogleFonts.inter(),
                  ),
                  TextButton(
                    onPressed: statistiqueModel.donnees.isEmpty
                        ? null
                        : () {
                            Get.toNamed(AppRoute.statistique, arguments: {
                              "statistique": user.donnees[0]["is_admin"] == true
                                  ? statistiqueModel.donnees
                                  : statistiqueModel.suivis,
                            });
                          },
                    child: Text(
                      "Tout voir",
                      style: GoogleFonts.inter(
                          color: Colors.blue, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Statistique de l'évaluation passée",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              user.donnees[0]["is_admin"] == true
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: statistiqueModel.donnees.isEmpty
                          ? Center(
                              child: Text(
                                "Vous n'avez encore passé aucune évaluation",
                                style: GoogleFonts.inter(),
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  statistiqueModel.donnees.isEmpty ? 0 : 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Date',
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10),
                                            ),
                                            // const SizedBox(
                                            //   height: 5,
                                            // ),

                                            Text(
                                                '${statistiqueModel.donnees[0]['participations'][0]['evaluation']['dateDebut'] ?? ""}'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "petite note",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "${statistiqueModel.donnees[0]['petite_note'] ?? ""}"),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Moyenne",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "${statistiqueModel.donnees[0]['moyenne'] ?? ""}"),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "prémière note",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "${statistiqueModel.donnees[0]['premiereNote'] ?? ""}")
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: statistiqueModel.suivis.isEmpty
                          ? Center(
                              child: Text(
                                "Vous n'avez encore passé aucune évaluation",
                                style: GoogleFonts.inter(),
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  statistiqueModel.suivis.isEmpty ? 0 : 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Date',
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10),
                                            ),
                                            // const SizedBox(
                                            //   height: 5,
                                            // ),

                                            Text(
                                                '${statistiqueModel.suivis[0]['evaluation']['dateDebut'] ?? ""}'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Nom evaluation",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "${statistiqueModel.suivis[0]['evaluation']['nom'] ?? ""}"),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Note",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "${statistiqueModel.suivis[0]['note'] ?? ""}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
