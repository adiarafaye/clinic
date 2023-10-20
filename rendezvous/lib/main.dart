import 'package:flutter/material.dart';
import 'package:rendezvous/screens/admin/welcome_admin.dart';
import 'package:rendezvous/screens/doctors/welcome_doctor.dart';
import 'package:rendezvous/screens/login_screen.dart';
import 'package:rendezvous/screens/patients/home_patient.dart';
import 'package:rendezvous/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, Key}); // Correction : Remplacez "super.key" par "Key? key"

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
        '/welcomeadmin': (context) => const WelcomeAdmin(),
        '/welcomedoctor': (context) => const WelcomeDoctor(),
        '/homepatient': (context) => HomePatient(),
      },
      home: const WelcomeScreen(),
    );
  }
}
