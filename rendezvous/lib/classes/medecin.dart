import 'package:rendezvous/classes/admin.dart';
import 'package:rendezvous/classes/disponibilite.dart';
import 'package:rendezvous/classes/dossier.dart';
import 'package:rendezvous/classes/service.dart';
import 'package:rendezvous/classes/utilisateur.dart';

class Medecin {
  int idmedecin;
  String specialite;
  int utilisateur_idutilisateur;
  int admin_idadmin;

  Admin admin;
  Utilisateur utilisateur;
  List<Disponibilite> disponibilites;
  List<Dossier>? dossiers;
  List<Service>? services;

  Medecin(
    this.idmedecin,
    this.specialite,
    this.utilisateur_idutilisateur,
    this.admin_idadmin,
    this.admin,
    this.utilisateur,
    this.disponibilites,
    this.dossiers,
    this.services,
  );
  factory Medecin.fromJson(Map<String, dynamic> json) {
    return Medecin(
      json['idmedecin'],
      json['specialite'],
      json['utilisateur_idutilisateur'],
      json['admin_idadmin'],
      Admin.fromJson(json['admin']),
      Utilisateur.fromJson(json['utilisateur']),
      List<Disponibilite>.from(
          json['disponibilites'].map((x) => Disponibilite.fromJson(x))),
      List<Dossier>.from(json['dossiers'].map((x) => Dossier.fromJson(x))),
      List<Service>.from(json['services'].map((x) => Service.fromJson(x))),
    );
  }
}
