import 'package:flutter/material.dart';
import 'package:rendezvous/classes/wsManager.dart';
import 'package:rendezvous/screens/doctors/creerdossier_doctor.dart';
import 'package:rendezvous/screens/doctors/docpatient_doctor.dart';
import 'package:rendezvous/screens/doctors/planning_doctor.dart';

void main() {
  runApp(MaterialApp(home: WelcomeDoctor()));
}

class WelcomeDoctor extends StatefulWidget {
  const WelcomeDoctor({Key? key}) : super(key: key);

  @override
  _WelcomeDoctorState createState() => _WelcomeDoctorState();
}

class _WelcomeDoctorState extends State<WelcomeDoctor> {
  // Nom du médecin
  final doctorName = "Dr. ADIARA"; // Remplacez par le nom du médecin

  // Liste de consultations des patients du jour
  List<Map<String, dynamic>> patientConsultations = [
    {
      'patientName': 'Mary Johnson',
      'date': '2023-09-30',
      'time': '11:00 AM',
      'isPresent': false,
      'hasMedicalRecord': false,
    },
    {
      'patientName': 'David Smith',
      'date': '2023-09-30',
      'time': '03:30 PM',
      'isPresent': false,
      'hasMedicalRecord': true,
    },
    // Ajoutez d'autres consultations fictives du jour
  ];
  late var patients;

  @override
  void initState() {
    // TODO: implement initState
    getDatas();
    super.initState();
  }

  getDatas() async {
    patients = await WsManager().getPatients();
    print(patients);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Bienvenue, $doctorName'), // Afficher le nom du médecin dans l'AppBar
        backgroundColor: const Color.fromARGB(235, 10, 190, 145),
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
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(235, 10, 190, 145).withOpacity(0.8),
                    const Color.fromARGB(235, 10, 190, 145),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Clinic Hajara",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      doctorName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.9,
                  children: [
                    Card(
                      margin: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DocPatientDoctor(),
                            ),
                          );
                        },
                        splashColor: Colors.green,
                        child: const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.cases_outlined,
                                size: 30.0,
                              ),
                              Text(
                                "Dossier patients",
                                style: TextStyle(fontSize: 10.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //  context,
                          //MaterialPageRoute(
                          //builder: (context) => CreerdossierDoctor(),
                          //),
                        },
                        splashColor: Colors.green,
                        child: const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.create,
                                size: 30.0,
                              ),
                              Text(
                                "Rendez-vous",
                                style: TextStyle(fontSize: 10.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlanningDoctor(),
                            ),
                          );
                        },
                        splashColor: Colors.green,
                        child: const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 30.0,
                              ),
                              Text(
                                "Planning",
                                style: TextStyle(fontSize: 10.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Consultations du Jour',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: patientConsultations.length,
                itemBuilder: (context, index) {
                  final consultation = patientConsultations[index];
                  final patientName = consultation['patientName'] ?? '';
                  final date = consultation['date'] ?? '';
                  final time = consultation['time'] ?? '';
                  bool isPresent = consultation['isPresent'] ?? false;

                  return ListTile(
                    title: Text("Patient: $patientName"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date: $date, Heure: $time"),
                        Row(
                          children: [
                            const Text("Présent: "),
                            IconButton(
                              icon: Icon(
                                isPresent ? Icons.check_circle : Icons.circle,
                                color: isPresent ? Colors.green : Colors.grey,
                              ),
                              onPressed: () {
                                // Inversez l'état de la présence du patient
                                setState(() {
                                  patientConsultations[index]['isPresent'] =
                                      !isPresent;
                                });
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreerdossierDoctor(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                    235, 10, 190, 145), // Couleur du bouton
                              ),
                              child: const Text("Voir Détail",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
