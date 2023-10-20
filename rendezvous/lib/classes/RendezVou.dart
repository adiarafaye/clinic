class RendezVou {
  int idrendezVous;
  DateTime heure;
  DateTime date;
  String rapportRdv;
  String statut;
  int patientIdpatient;
  int serviceIdservice;

  RendezVou(
    this.idrendezVous,
    this.heure,
    this.date,
    this.rapportRdv,
    this.statut,
    this.patientIdpatient,
    this.serviceIdservice,
  );
  factory RendezVou.fromJson(Map<String, dynamic> json) => RendezVou(
        json["idrendez-vous"],
        DateTime.parse(json["heure"]),
        DateTime.parse(json["date"]),
        json["rapportRdv"],
        json["statut"],
        json["patient_idpatient"],
        json["service_idservice"],
      );
}
