import 'package:rendezvous/classes/medecin.dart';
import 'package:rendezvous/classes/utilisateur.dart';

class Admin {
  int idadmin;
  int utilisateur_idutilisateur;

  Utilisateur utilisateur;
  List<Medecin>? medecins;

  Admin(
    this.idadmin,
    this.utilisateur_idutilisateur,
    this.utilisateur,
    this.medecins,
  );
  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      json['idadmin'],
      json['utilisateur_idutilisateur'],
      Utilisateur.fromJson(json['utilisateur']),
      List<Medecin>.from(json['medecins'].map((x) => Medecin.fromJson(x))),
    );
  }
}
