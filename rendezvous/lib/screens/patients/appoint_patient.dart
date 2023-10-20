import 'package:flutter/material.dart';

class AppointPatient extends StatefulWidget {
  const AppointPatient({Key? key}) : super(key: key);

  @override
  _AppointPatientState createState() => _AppointPatientState();
}

class _AppointPatientState extends State<AppointPatient> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Détails du médecin"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage('images/doctor1.jpg'),
              backgroundColor: Colors.white,
            ),
            const Text(
              "Dr Hajara",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                );

                if (selectedDate != null) {
                  setState(() {
                    _selectedDay = selectedDate;
                  });
                }
              },
              decoration: const InputDecoration(
                labelText: "Sélectionnez une date",
                prefixIcon: Icon(Icons.calendar_today),
              ),
              controller: _selectedDay != null
                  ? TextEditingController(
                      text:
                          "${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}")
                  : null,
            ),
            const SizedBox(height: 20),
            if (_selectedDay != null)
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Rendez-vous confirmé"),
                        content: Text(
                            "Vous avez pris rendez-vous avec le Dr. Hajara le ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Fermer"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Prendre rendez-vous avec le docteur"),
              ),
          ],
        ),
      ),
    );
  }
}
