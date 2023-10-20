import 'package:flutter/material.dart';

class RvAdmin extends StatefulWidget {
  const RvAdmin({super.key});

  @override
  _RvAdminState createState() => _RvAdminState();
}

class _RvAdminState extends State<RvAdmin> {
  // Liste de rendez-vous fictifs du médecin
  List<Map<String, String>> doctorAppointments = [
    {
      'patientName': 'John Doe',
      'date': '2023-09-30',
      'time': '09:00 AM',
    },
    {
      'patientName': 'Alice Johnson',
      'date': '2023-09-30',
      'time': '10:30 AM',
    },
    {
      'patientName': 'Bob Smith',
      'date': '2023-09-30',
      'time': '02:00 PM',
    },
    // Ajoutez d'autres rendez-vous fictifs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
        color: Colors.white,
        child: ListView.builder(
          itemCount: doctorAppointments.length,
          itemBuilder: (context, index) {
            final appointment = doctorAppointments[index];
            final patientName = appointment['patientName'] ?? '';
            final date = appointment['date'] ?? '';
            final time = appointment['time'] ?? '';

            return ListTile(
              title: Text("Patient: $patientName"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: $date, Heure: $time"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
