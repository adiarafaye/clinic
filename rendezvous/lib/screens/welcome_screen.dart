import 'package:flutter/material.dart';
import 'package:rendezvous/screens/login_screen.dart';
//import 'package:rendezvous/screens/signup_scren.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(children: [
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(
                //builder: (context)=>
                //));
              },
              child: const Text(
                "",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset("images/doc1.jpg", height: 350),
          ),
          const SizedBox(height: 10),
          const Text(
            "Clinic Hajara",
            style: TextStyle(
              color: Color.fromARGB(235, 10, 190, 145),
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Bienvenue",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Material(
              color: const Color.fromARGB(235, 10, 190, 145),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                  child: Text(
                    "Commencer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            /*Material(
              color: const Color.fromARGB(235, 10, 190, 145),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                 child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    "je suis patient",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),*/
          ]),
        ]),
      ),
    );
  }
}
