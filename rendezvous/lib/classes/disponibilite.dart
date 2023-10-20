import 'package:rendezvous/classes/medecin.dart';

class Disponibilite {
  int iddisponibilite;
  DateTime heure;
  DateTime date;
  int medecin_idmedecin;

  Medecin? medecin;

  Disponibilite(
    this.iddisponibilite,
    this.heure,
    this.date,
    this.medecin_idmedecin,
  );
  factory Disponibilite.fromJson(Map<String, dynamic> json) {
    return Disponibilite(
      json['iddisponibilite'],
      DateTime.parse(json['heure']),
      DateTime.parse(json['date']),
      json['medecin_idmedecin'],
    );
  }
}
