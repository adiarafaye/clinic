// Importez showDialog
import 'package:flutter/material.dart';
import 'package:rendezvous/classes/wsManager.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;
  String selectedGender = 'Homme'; // Genre sélectionné par défaut
  DateTime selectedDate = DateTime.now(); // Date de naissance sélectionnée
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1000), // Date de début
      lastDate: DateTime.now(), // Date de fin (aujourd'hui)
    );

    if (pickedDate != null) {
      // Vérifier si la date choisie n'est pas nulle
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  List<String> genres = ['Homme', 'Femme'];
  String? selectedGenreValue;

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Succès"),
          content: const Text("Votre compte a été créé avec succès."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermez la boîte de dialogue
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Green.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset("images/Signup.png", height: 200),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: _nomController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Entrer votre nom",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _prenomController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Entrer votre prénom ",
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
                    labelText: "Entrer votre téléphone",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => _selectDate(context), // Afficher le calendrier
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: "Date de naissance",
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(fontSize: 16),
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
                TextField(
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
                        passToggle ? Icons.visibility_off : Icons.visibility,
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
                        onTap: () {
                          var patient = {
                            "nom": _nomController.text,
                            "prenom": _prenomController.text,
                            "email": _emailController.text,
                            "telephone": _telephoneController.text,
                            "password": _passwordController.text,
                            "genre": selectedGenreValue,
                            "dateNaiss":
                                DateFormat('yyyy-MM-dd').format(selectedDate),
                          };
                          print(patient);
                          var result = WsManager().createPatient(patient);
                          print('réponse: $result');
                          _showSuccessDialog(); // Afficher la boîte de dialogue de succès
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
                /*const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous avez déjà un compte?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 200, 83),
                        ),
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
