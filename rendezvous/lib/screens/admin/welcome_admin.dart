import 'package:flutter/material.dart';
import 'package:rendezvous/screens/admin/listdoc_admin.dart';
import 'package:rendezvous/screens/admin/listpatient_admin.dart';
import 'package:rendezvous/screens/admin/rv_admin.dart';
import 'package:rendezvous/screens/admin/signmed_admin.dart';
import 'package:rendezvous/screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(home: WelcomeAdmin()));
}

class WelcomeAdmin extends StatelessWidget {
  const WelcomeAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenue Admin"),
        backgroundColor: const Color.fromARGB(235, 10, 190, 145),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(235, 10, 190, 145).withOpacity(0.9),
                    const Color.fromARGB(235, 10, 190, 145),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              accountName: const Text("Nom de l'utilisateur"),
              accountEmail: const Text("Prénom de l'utilisateur"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(235, 10, 190, 145),
                ),
              ),
              otherAccountsPictures: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ));
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(235, 10, 190, 145),
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Liste des Patients'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListPatientAdmin(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.perm_contact_calendar_sharp),
              title: const Text('listes rendez-vous'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RvAdmin(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text('Créer médecin'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignmedAdmin(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Liste médecin'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListDocAdmin(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(235, 10, 190, 145).withOpacity(0.8),
                      const Color.fromARGB(235, 10, 190, 145),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 200.0),
                    UserCategoryCard(
                      category: 'Rendez-vous',
                      count: 2, // Remplacez par le nombre de professeurs
                      icon: Icons.sick,
                    ),
                    const SizedBox(height: 16.0),
                    UserCategoryCard(
                      category: 'Utilisateurs',
                      count: 0, // Remplacez par le nombre de professeurs
                      icon: Icons.person,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserCategoryCard extends StatelessWidget {
  final String category;
  final int count;
  final IconData icon;

  const UserCategoryCard({
    required this.category,
    required this.count,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: const Color.fromARGB(235, 10, 190, 145),
            ),
            const SizedBox(height: 8.0),
            Text(
              category,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Nombre : $count',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
