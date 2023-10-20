import 'package:rendezvous/classes/admin.dart';
import 'package:rendezvous/classes/medecin.dart';
import 'package:rendezvous/classes/patient.dart';

class Utilisateur {
  int idutilisateur;
  String nom;
  String prenom;
  String email;
  String telephone;
  String genre;
  String password;
  String profile;
  List<Admin>? admins;
  List<Medecin>? medecins;
  List<Patient>? patients;

  Utilisateur(
    this.idutilisateur,
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
    this.genre,
    this.password,
    this.profile,
    this.admins,
    this.medecins,
    this.patients,
  );
  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      json['idutilisateur'],
      json['nom'],
      json['prenom'],
      json['email'],
      json['telephone'],
      json['genre'],
      json['password'],
      json['profile'],
      List<Admin>.from(json['admins'].map((x) => Admin.fromJson(x))),
      List<Medecin>.from(json['medecins'].map((x) => Medecin.fromJson(x))),
      List<Patient>.from(json['patients'].map((x) => Patient.fromJson(x))),
    );
  }
}
