import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rendezvous/screens/patients/DoctorsAvailablePage.dart';
import 'package:rendezvous/screens/patients/doctors_section.dart';

void main() {
  runApp(MaterialApp(home: HomePatient()));
}

class HomePatient extends StatelessWidget {
  final String patientName =
      "Marieme"; // Remplacez "NomDuPatient" par le nom du patient

  List<String> catNames = [
    "Dentiste",
    "Cardiologue",
    "Ophtalmologue",
    "Neurologue",
    "ORL",
    "Pédiatrie",
    "Cancérologue",
    "Gynécologue",
  ];

  List<IconData> catIcons = [
    MdiIcons.toothOutline,
    MdiIcons.heartPlus,
    MdiIcons.eye,
    MdiIcons.brain,
    MdiIcons.earHearing,
    MdiIcons.babyBottleOutline,
    MdiIcons.bacteria,
    MdiIcons.humanPregnant,
  ];

  HomePatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Bienvenue, $patientName'), // Afficher le nom du patient dans l'AppBar
        backgroundColor: const Color.fromARGB(255, 10, 190, 145),
        actions: [
          IconButton(
            icon: Icon(Icons.edit), // Bouton d'édition
            onPressed: () {
              // Mettez ici la logique pour l'édition
            },
          ),
          IconButton(
            icon: Icon(Icons.logout), // Bouton de déconnexion
            onPressed: () {
              // Mettez ici la logique pour la déconnexion
            },
          ),
        ],
      ),
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 10, 190, 145)
                              .withOpacity(0.8),
                          const Color.fromARGB(255, 10, 190, 145),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('images/doctor1.jpg'),
                            ),*/
                            /*Icon(
                              Icons.notification_add_outlined,
                              color: Colors.white,
                              size: 30,
                            ),*/
                          ],
                        ),
                        SizedBox(height: 15),
                        /*Text(
                          "Hi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),*/
                        SizedBox(height: 20),
                        Text(
                          "Clinic Hajara",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Recherche...",
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black12.withOpacity(0.7),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catNames.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DoctorsAvailablePage(
                                serviceName: catNames[index]),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 15,
                            ),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 10, 190, 145),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                catIcons[index],
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black12.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Profil Docteurs",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black12.withOpacity(0.7),
                  ),
                ),
              ),
              DoctorsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
