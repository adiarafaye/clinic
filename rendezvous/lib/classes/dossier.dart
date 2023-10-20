import 'package:rendezvous/classes/medecin.dart';
import 'package:rendezvous/classes/patient.dart';

class Dossier {
  int iddossier;
  String diagnostic;
  String traitement;
  String evolution;
  int medecin_idmedecin;
  int patient_idpatient;

  Medecin medecin;
  Patient patient;

  Dossier(
    this.iddossier,
    this.diagnostic,
    this.traitement,
    this.evolution,
    this.medecin_idmedecin,
    this.patient_idpatient,
    this.medecin,
    this.patient,
  );
  factory Dossier.fromJson(Map<String, dynamic> json) {
    return Dossier(
      json['iddossier'],
      json['diagnostic'],
      json['traitement'],
      json['evolution'],
      json['medecin_idmedecin'],
      json['patient_idpatient'],
      Medecin.fromJson(json['medecin']),
      Patient.fromJson(json['patient']),
    );
  }
}
