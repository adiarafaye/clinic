import 'package:flutter/material.dart';

class CreerdossierDoctor extends StatefulWidget {
  const CreerdossierDoctor({super.key});

  @override
  _CreerdossierDoctorState createState() => _CreerdossierDoctorState();
}

class _CreerdossierDoctorState extends State<CreerdossierDoctor> {
  // Vous pouvez ajouter les champs et les variables nécessaires pour la création du dossier médical
  bool patientHasMedicalRecord =
      false; // Exemple : par défaut, le patient n'a pas de dossier

  // Contrôleurs de champs de saisie pour les informations du patient
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  // Fonction pour créer le dossier médical
  void createMedicalRecord(String patientName, String birthDate) {
    // Ajoutez ici la logique pour créer le dossier médical en utilisant les données saisies.
    // Exemple : Vous pouvez enregistrer les données dans une base de données.
    // Une fois le dossier médical créé, vous pouvez mettre à jour patientHasMedicalRecord.
    // Dans cet exemple, nous le mettrons simplement à vrai pour simuler la création du dossier.
    setState(() {
      patientHasMedicalRecord = true;
    });

    // Après la création, vous pouvez afficher un message de confirmation ou naviguer vers une autre page si nécessaire.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dossier Médical Créé'),
          content: const Text('Le dossier médical du patient a été créé.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer Dossier Médical'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Champ de saisie pour le nom du patient
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nom du patient'),
            ),
            // Champ de saisie pour la date de naissance du patient
            TextField(
              controller: birthDateController,
              decoration: const InputDecoration(labelText: 'Date de naissance'),
            ),
            // Ajoutez d'autres champs de saisie pour d'autres informations du patient si nécessaire.

            // Bouton de création de dossier médical
            ElevatedButton(
              onPressed: () {
                if (patientHasMedicalRecord) {
                  // Le patient a déjà un dossier médical, vous pouvez afficher le dossier existant
                  // ou afficher un message.
                  // Par exemple, vous pouvez afficher un message d'alerte.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Dossier Médical Existant'),
                        content:
                            const Text('Le dossier médical du patient existe déjà.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Fermer'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Le patient n'a pas de dossier médical, vous pouvez appeler la fonction createMedicalRecord
                  // en utilisant les données saisies dans les champs de saisie.
                  String patientName = nameController.text;
                  String birthDate = birthDateController.text;
                  createMedicalRecord(patientName, birthDate);
                }
              },
              child: const Text('Créer Dossier Médical'),
            ),
          ],
        ),
      ),
    );
  }
}
