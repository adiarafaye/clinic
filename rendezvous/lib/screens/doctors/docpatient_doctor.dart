import 'package:flutter/material.dart';

class Patient {
  String nom;
  String prenom;
  String diagnostic;
  DossierPatient dossier;

  Patient(this.nom, this.prenom, this.diagnostic, this.dossier);
}

class DossierPatient {
  String evolution;
  String traitement;

  DossierPatient(this.evolution, this.traitement);
}

class DocPatientDoctor extends StatefulWidget {
  const DocPatientDoctor({super.key});

  @override
  _DocPatientDoctorState createState() => _DocPatientDoctorState();
}

class _DocPatientDoctorState extends State<DocPatientDoctor> {
  final List<Patient> patients = [
    Patient("Doe", "John", "Hypertension",
        DossierPatient("Évolution Hypertension", "Traitement Hypertension")),
    Patient("Smith", "Jane", "Diabète",
        DossierPatient("Évolution Diabète", "Traitement Diabète")),
    // Ajoutez d'autres patients ici
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PatientList(patients: patients),
    );
  }
}

class PatientList extends StatefulWidget {
  final List<Patient> patients;

  const PatientList({super.key, required this.patients});

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Patients'),
      ),
      body: ListView.builder(
        itemCount: widget.patients.length,
        itemBuilder: (context, index) {
          final patient = widget.patients[index];
          return ListTile(
            title: Text('${patient.nom}, ${patient.prenom}'),
            subtitle: Text('Diagnostic: ${patient.diagnostic}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetail(patient: patient),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PatientDetail extends StatefulWidget {
  final Patient patient;

  const PatientDetail({super.key, required this.patient});

  @override
  _PatientDetailState createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  bool isEditing = false;
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController diagnosticController = TextEditingController();
  TextEditingController evolutionController = TextEditingController();
  TextEditingController traitementController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomController.text = widget.patient.nom;
    prenomController.text = widget.patient.prenom;
    diagnosticController.text = widget.patient.diagnostic;
    evolutionController.text = widget.patient.dossier.evolution;
    traitementController.text = widget.patient.dossier.traitement;
  }

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      widget.patient.nom = nomController.text;
      widget.patient.prenom = prenomController.text;
      widget.patient.diagnostic = diagnosticController.text;
      widget.patient.dossier.evolution = evolutionController.text;
      widget.patient.dossier.traitement = traitementController.text;
      isEditing = false;
    });
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Supprimer le dossier'),
          content: const Text(
              'Êtes-vous sûr de vouloir supprimer le dossier de ce patient ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Supprimer le patient de la liste
                widget.patient;
                Navigator.of(context).pop(); // Revenir à la liste des patients
              },
              child: const Text('Supprimer'),
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
        title: const Text('Détails du Patient'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _toggleEditing,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _confirmDelete(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Ajout de SingleChildScrollView ici
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isEditing)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Nom:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: nomController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Prénom:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: prenomController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Diagnostic:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: diagnosticController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Évolution:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: evolutionController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Traitement:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: traitementController,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _saveChanges,
                    child: const Text('Enregistrer'),
                  ),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Nom: ${widget.patient.nom}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Prénom: ${widget.patient.prenom}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Diagnostic: ${widget.patient.diagnostic}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Évolution: ${widget.patient.dossier.evolution}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Traitement: ${widget.patient.dossier.traitement}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
