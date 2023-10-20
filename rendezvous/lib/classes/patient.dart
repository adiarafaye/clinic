import 'package:rendezvous/classes/utilisateur.dart';

import 'package:rendezvous/classes/RendezVou.dart';
import 'package:rendezvous/classes/dossier.dart';
import 'package:intl/intl.dart';

class Patient {
  int idpatient;
  String? genre;
  DateTime dateNaiss;
  int utilisateur_idutilisateur;

  Utilisateur? utilisateur;
  List<Dossier>? dossiers;
  List<RendezVou>? rendez_vous;

  Patient(
    this.idpatient,
    this.genre,
    this.dateNaiss,
    this.utilisateur_idutilisateur,
    /* this.utilisateur,
    this.dossiers,
    this.rendez_vous,*/
  );
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      json['idpatient'],
      json['genre'] ?? '',
      DateFormat('yyyy-MM-dd').parse(json['dateNaiss']),
      json['utilisateur_idutilisateur'],
      /*Utilisateur.fromJson(json['utilisateur']),
      List<Dossier>.from(json['dossiers'].map((x) => Dossier.fromJson(x))),
      List<RendezVou>.from(
          json['rendez_vous'].map((x) => RendezVou.fromJson(x))),*/
    );
  }
}
