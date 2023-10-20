import 'package:flutter/material.dart';
import 'package:rendezvous/classes/wsManager.dart';

class Medecin {
  final String nom;
  final String prenom;
  final String specialite;
  bool actif;

  Medecin(this.nom, this.prenom, this.specialite, {this.actif = true});
}

class ListDocAdmin extends StatefulWidget {
  const ListDocAdmin({super.key});

  @override
  _ListDocAdminState createState() => _ListDocAdminState();
}

class _ListDocAdminState extends State<ListDocAdmin> {
  List<Medecin> medecins = [
    Medecin("Doe", "John", "Généraliste"),
    Medecin("Smith", "Jane", "Dermatologue"),
    // Ajoutez d'autres médecins ici
  ];
//late var medecins;

  @override
  void initState() {
    // TODO: implement initState
    getDatas();
    super.initState();
  }

  getDatas() async {
    medecins = await WsManager().getMedecins();
    print(medecins);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Médecins'),
      ),
      body: ListView.builder(
        itemCount: medecins.length,
        itemBuilder: (context, index) {
          final medecin = medecins[index];
          return ListTile(
            title: Text('${medecin.nom} ${medecin.prenom}'),
            subtitle: Text(medecin.specialite),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    medecin.actif ? Icons.lock_open : Icons.lock,
                    color: medecin.actif ? Colors.green : Colors.red,
                  ),
                  onPressed: () {
                    _activerDesactiverCompteMedecin(medecin);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _modifierMedecin(medecin, index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _demanderConfirmationSuppressionMedecin(medecin, index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _ajouterMedecin();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _ajouterMedecin() {
    Medecin newMedecin = Medecin("Nouveau", "Médecin", "Spécialité inconnue");
    setState(() {
      medecins.add(newMedecin);
    });
  }

  void _modifierMedecin(Medecin medecin, int index) {
    // Ajoutez ici la logique pour modifier le médecin
    // Par exemple, vous pouvez ouvrir une nouvelle page de modification ici.
  }

  void _activerDesactiverCompteMedecin(Medecin medecin) {
    setState(() {
      medecin.actif = !medecin.actif;
    });
  }

  void _demanderConfirmationSuppressionMedecin(Medecin medecin, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Supprimer le compte'),
          content: Text(
              'Voulez-vous vraiment supprimer le compte de ${medecin.nom} ${medecin.prenom} ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _supprimerMedecin(index);
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }

  void _supprimerMedecin(int index) {
    setState(() {
      medecins.removeAt(index);
    });
  }
}
