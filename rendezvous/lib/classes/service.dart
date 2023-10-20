import 'package:rendezvous/classes/RendezVou.dart';
import 'package:rendezvous/classes/medecin.dart';

class Service {
  int idservice;
  String nomService;
  List<RendezVou>? rendez_vous;
  List<Medecin>? medecins;

  Service(
    this.idservice,
    this.nomService,
    this.rendez_vous,
    this.medecins,
  );
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      json['idservice'],
      json['nomService'],
      List<RendezVou>.from(
          json['rendez_vous'].map((x) => RendezVou.fromJson(x))),
      List<Medecin>.from(json['medecins'].map((x) => Medecin.fromJson(x))),
    );
  }
}
