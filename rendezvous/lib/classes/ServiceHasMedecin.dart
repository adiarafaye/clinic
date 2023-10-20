import 'package:rendezvous/classes/medecin.dart';
import 'package:rendezvous/classes/service.dart';

class ServiceHasMedecin {
  int serviceIdService;
  int medecinIdMedecin;
  Medecin medecin;
  Service service;

  ServiceHasMedecin(
    this.serviceIdService,
    this.medecinIdMedecin,
    this.medecin,
    this.service,
  );
}
