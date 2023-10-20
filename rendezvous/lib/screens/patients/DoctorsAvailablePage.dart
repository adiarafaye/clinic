import 'package:flutter/material.dart';

class DoctorsAvailablePage extends StatelessWidget {
  final String serviceName;

  const DoctorsAvailablePage({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    // Mettez en place la page pour afficher les médecins disponibles pour le service sélectionné.
    // Vous pouvez utiliser le nom du service (serviceName) pour récupérer les médecins appropriés.
    return Scaffold(
      appBar: AppBar(
        title: Text('Médecins disponibles pour $serviceName'),
      ),
      body: Center(
        child: Text(
            'Contenu de la page des médecins disponibles pour $serviceName'),
      ),
    );
  }
}
