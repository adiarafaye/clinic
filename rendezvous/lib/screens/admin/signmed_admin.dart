
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rendezvous/classes/wsManager.dart';
//import 'package:rendezvous/screens/patients/home_patient.dart';

class SignmedAdmin extends StatefulWidget {
  const SignmedAdmin({Key? key}) : super(key: key);

  @override
  State<SignmedAdmin> createState() => _SignmedAdminState();
}

class _SignmedAdminState extends State<SignmedAdmin> {
  bool passToggle = true;
  String selectedGender = 'Homme'; // Genre sélectionné par défaut
  String selectedSpecialite =
      'gynécologue'; // Spécialité sélectionnée par défaut
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  WsManager wsManager = WsManager();
  var idUser;

  List<String> specialites = [
    'Gynécologue',
    'Dentiste',
    'Cardiologue',
    'Ophtalmoloque',
    'Neurologue',
    'Pédiatre',
    'oto-rhino-laryngologiste(ORL)',
    'Cancérologue',
    // Ajoutez d'autres spécialités selon vos besoins
  ];

  List<String> genres = [
    'Homme',
    'Femme',
  ];

  String? selectedSpecialiteValue;
  String? selectedGenreValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(
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
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 200), // Ajuster la hauteur
                    TextFormField(
                      controller: _nomController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Entrer votre nom",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 10), // Ajuster la hauteur
                    TextFormField(
                      controller: _prenomController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Entrer votre prénom",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Entrer votre Email",
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _telephoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Entrer votre numéro de téléphone",
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text("Sélectionnez le genre"),
                          value: selectedGenreValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedGenreValue = newValue;
                            });
                          },
                          items: genres.map((valueItem) {
                            return DropdownMenuItem<String>(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text("Sélectionnez une spécialité"),
                          value: selectedSpecialiteValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedSpecialiteValue = newValue;
                            });
                          },
                          items: specialites.map((valueItem) {
                            return DropdownMenuItem<String>(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Entrer votre mot de passe",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(
                            passToggle
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Material(
                          color: const Color.fromARGB(235, 10, 190, 145),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () async {
                              idUser = await wsManager.getAdminId();

                              var medecin = {
                                "admin_idadmin": idUser,
                                "nom": _nomController.text,
                                "prenom": _prenomController.text,
                                "email": _emailController.text,
                                "telephone": _telephoneController.text,
                                "password": _passwordController.text,
                                "genre": selectedGenreValue,
                                "specialiste": selectedSpecialite,
                              };
                              print(medecin);
                              var response =
                                  await WsManager().createMedecin(medecin);
                              print('création medecin,: $response');
                              /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePatient(),
                                ),
                              );*/
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 40),
                              child: Center(
                                child: Text(
                                  "Créer compte",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
