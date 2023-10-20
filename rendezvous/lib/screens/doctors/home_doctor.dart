import 'package:flutter/material.dart';
import 'package:rendezvous/screens/doctors/profil_doctor.dart';
import 'package:rendezvous/screens/doctors/welcome_doctor.dart';
import 'package:rendezvous/screens/doctors/appoint_doctor.dart';

class HomeDoctor extends StatefulWidget {
  const HomeDoctor({Key? key}) : super(key: key);

  @override
  _HomeDoctorState createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const WelcomeDoctor(),
    const AppointDoctor(),
    const ProfilDoctor(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // Use a Column to stack the screens and the bottomNavigationBar
        children: [
          Expanded(
            child: _screens.elementAt(_selectedIndex),
          ),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Rendez-vous',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
