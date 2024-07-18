import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrade_employ/component/constante.dart';
import 'package:upgrade_employ/component/historique.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        children: [
          Text(
            "Bonjour Admin",
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "Nous somme heureux de vous revoir",
            style: GoogleFonts.inter(
              color: const Color(0xFF9E9E9E),
            ),
          ),
          SizedBox(height: 15),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
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
                          color: Colors.blue, fontWeight: FontWeight.w800),
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
          ),
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
                  onPressed: () {
                    Get.toNamed(AppRoute.prochaineEvaluation);
                  },
                  child: Text(
                    "Tout voir",
                    style: GoogleFonts.inter(
                        color: Colors.blue, fontWeight: FontWeight.w800),
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          HistoriqueWidget(
            date: "20/08/2024",
            nombreParticipant: 12,
            prochain: "HSE",
          ),
          HistoriqueWidget(
            date: "25/10/2024",
            nombreParticipant: 12,
            prochain: "Semestrielle",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Statistique",
                style: GoogleFonts.inter(),
              ),
              TextButton(
                onPressed: () {},
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
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('12/07/2024'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "petite note",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("12"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "moyenne",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("15"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "prémière note",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("18")
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
