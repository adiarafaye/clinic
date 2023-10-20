import 'dart:convert';
import 'package:rendezvous/classes/medecin.dart';
import 'package:rendezvous/classes/patient.dart';
import 'package:rendezvous/classes/session.dart' as session;
import 'package:http/http.dart' as http;

class WsManager {
  var base_url = 'http://192.168.1.10:8000/api/';
  //RECUPERATION DONNEES PATIENTS
  getPatients() async {
    try {
      final url = '${base_url}patient';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable serverResponse = jsonDecode(response.body);
        print(serverResponse);
        //  List<Dossier>.from(json['dossiers'].map((x) => Dossier.fromJson(x))),

        List<Patient> patients =
            List<Patient>.from(serverResponse.map((patient) {
          return Patient.fromJson(patient);
        }));
        print(patients);
        return patients;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

//RECUPERATION DONNEES MEDECIN
  getMedecins() async {
    try {
      final url = '${base_url}medecin';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable serverResponse = jsonDecode(response.body);
        print(serverResponse);
        //  List<Dossier>.from(json['dossiers'].map((x) => Dossier.fromJson(x))),

        List<Medecin> medecins =
            List<Medecin>.from(serverResponse.map((medecin) {
          return Medecin.fromJson(medecin);
        }));
        print(medecins);
        return medecins;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  createPatient(patient) async {
    try {
      final url = '${base_url}patient';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(patient),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  createMedecin(medecin) async {
    try {
      final url = '${base_url}medecin';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(medecin),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : $response');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  getUserId() async {
    return await session.getUserId();
  }

  getAdminId() async {
    return await session.getAdminId();
  }

  createDisponibilite(disponibilite) async {
    try {
      final url = '${base_url}disponibilite';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(disponibilite),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }
  /*getUserId() async {
    return await session.getUserId();
  }*/

  getMedecinId() async {
    return await session.getMedecinId();
  }

  Future<String> checkLogin(String username, String password) async {
    try {
      final url = '${base_url}users/login';
      var body = {
        'email': username,
        'password': password,
      };

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        int userId = serverResponse['idutilisateur'];
        String profile = serverResponse['profile'];
        session.setUserId(userId);
        session.setUserProfile(profile);

        if (profile == 'Admin') {
          print(serverResponse['admins']);
          int idadmin = serverResponse['admins'][0]['idadmin'];
          session.setAdminId(idadmin);
          return 'Admin';
        } else if (profile == 'medecin') {
          return 'Medecin';
        } else if (profile == 'patient') {
          return 'patient';
        } else {
          return 'Type d\'utilisateur inconnu';
        }
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }
}
