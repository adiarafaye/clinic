//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rendezvous/classes/wsManager.dart';
import 'package:rendezvous/screens/admin/welcome_admin.dart';
// ignore: unused_import
import 'package:rendezvous/screens/doctors/home_doctor.dart';
import 'package:rendezvous/screens/doctors/welcome_doctor.dart';
import 'package:rendezvous/screens/patients/home_patient.dart';
import 'package:rendezvous/screens/signup_scren.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  WsManager wsManager = WsManager();

  void login() {
    bool isValidStudent(String email, String password) {
      return true;
    }

    bool isValidTeacher(String email, String password) {
      return true;
    }

    bool isValidAdmin(String email, String password) {
      return true;
    }

    bool isValidResponsable(String email, String password) {
      return true;
    }

    void showErrorMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    // Ajoutez ici la logique de connexion
    // Vous pouvez utiliser les fonctions isValid* pour vérifier le type d'utilisateur
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Green.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset("images/login.jpg", height: 250),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Entrer votre mail",
                        prefixIcon: Icon(Icons.mail),
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Material(
                          color: const Color.fromARGB(235, 10, 190, 145),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () async {
                              // Naviguez vers la page principale (main.dart) ou toute autre page souhaitée.
                              //Navigator.of(context).pushNamed('/per');
                              var response = await wsManager.checkLogin(
                                  _emailController.text,
                                  _passwordController.text);
                              print("réponse:  + $response");
                              if (response == 'Admin') {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WelcomeAdmin()),
                                );
                              } else if (response == 'Medecin') {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WelcomeDoctor()),
                                );
                              } else if (response == 'patient') {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => HomePatient()),
                                );
                              } else {
                                print('Cet utilisateur n\'existe pas');
                              }
                              //checkLogin(
                              //   _emailController.text, _passwordController.text);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 40),
                              child: Center(
                                child: Text(
                                  "Se Connecter",
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
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Nouveau patient?",
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
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "S'inscrire",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(235, 10, 190, 145),
                            ),
                          ),
                        ),
                      ],
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

  void checkLogin(email, password) async {
    print('email: $email, password: $password');

    var response = await wsManager.checkLogin(email, password);
    print('réponse: $response');
    if (response == 'Admin') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const WelcomeAdmin()),
      );
    } else if (response == 'Medecin') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const WelcomeDoctor()),
      );
    } else if (response == 'patient') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomePatient()),
      );
    } else {
      print('Cet utilisateur n\'existe pas');
    }
  }
}
