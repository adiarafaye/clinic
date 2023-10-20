import 'package:flutter/material.dart';

class ProfilDoctor extends StatelessWidget {
  const ProfilDoctor({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 90),
                    const Align(
                      alignment: Alignment(0.0, -100.0),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage('images/doctor1.jpg'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Dr. John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Cardiologue',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nom complet: John Doe',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      'Spécialité: Cardiologue',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Action pour éditer le profil
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(235, 10, 190, 145),
                          ),
                          child: const Text('Éditer le profil'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Action pour la déconnexion
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(235, 10, 190, 145),
                          ),
                          child: const Text('Déconnexion'),
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
}
