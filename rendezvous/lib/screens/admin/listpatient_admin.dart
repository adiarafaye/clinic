import 'package:flutter/material.dart';
import 'package:rendezvous/classes/wsManager.dart';

class Patient {
  final String nom;
  final String prenom;
  final String dossier;
  bool actif;

  Patient(this.nom, this.prenom, this.dossier, {this.actif = true});
}

class ListPatientAdmin extends StatefulWidget {
  const ListPatientAdmin({super.key});

  @override
  _ListPatientAdminState createState() => _ListPatientAdminState();
}

class _ListPatientAdminState extends State<ListPatientAdmin> {
  List<Patient> patients = [
    Patient("Doe", "John", "Dossier médical de John Doe"),
    Patient("Smith", "Jane", "Dossier médical de Jane Smith", actif: false),
  ];
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _dossierController = TextEditingController();

//late var patients;
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Patients'),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return ListTile(
            title: Text('${patient.nom} ${patient.prenom}'),
            subtitle: Text(patient.dossier),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {
                    _voirDossierPatient(patient);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _modifierDossierPatient(patient, index);
                  },
                ),
                IconButton(
                  icon: Icon(
                    patient.actif ? Icons.lock_open : Icons.lock,
                    color: patient.actif ? Colors.green : Colors.red,
                  ),
                  onPressed: () {
                    _activerDesactiverComptePatient(patient);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _supprimerPatientConfirmation(patient, index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _voirDossierPatient(Patient patient) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${patient.nom} ${patient.prenom}'),
          content: Text(patient.dossier),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  void _modifierDossierPatient(Patient patient, int index) {
    // Ajoutez ici la logique pour modifier le dossier du patient
    // Par exemple, vous pouvez ouvrir une nouvelle page de modification ici.
  }

  void _activerDesactiverComptePatient(Patient patient) {
    setState(() {
      patient.actif = !patient.actif;
    });
  }

  void _supprimerPatientConfirmation(Patient patient, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Supprimer le patient'),
          content: Text(
              'Voulez-vous vraiment supprimer ${patient.nom} ${patient.prenom}?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Supprimer le patient de la liste
                setState(() {
                  patients.removeAt(index);
                });
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: const Text('Oui'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: const Text('Non'),
            ),
          ],
        );
      },
    );
  }
}
