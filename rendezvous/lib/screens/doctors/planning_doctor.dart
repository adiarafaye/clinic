import 'package:flutter/material.dart';
import 'package:rendezvous/classes/wsManager.dart';

class PlanningDoctor extends StatefulWidget {
  const PlanningDoctor({super.key});

  @override
  _PlanningDoctorState createState() => _PlanningDoctorState();
}

class _PlanningDoctorState extends State<PlanningDoctor> {
  final TextEditingController _textFieldController1 = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  WsManager wsManager = WsManager();
  var idUser;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _textFieldController1.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning'),
        backgroundColor: const Color.fromARGB(235, 10, 190, 145),
      ),
      body: Column(
        children: [
          Image.asset('images/planning.png', height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: "Sélectionnez une date",
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      child: Text(
                        _textFieldController1.text,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => _selectTime(context),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: "Sélectionnez l'heure",
                        prefixIcon: Icon(Icons.access_time),
                      ),
                      child: Text(
                        selectedTime.format(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    idUser = await wsManager.getMedecinId();

                    var disponibilite = {
                      "medecin_idmedecin": idUser,
                      "date": _textFieldController1.text,
                      " heure":
                          '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}'
                    };
                    print(disponibilite);
                    var result = WsManager().createDisponibilite(disponibilite);
                    print('réponse: $result');
                  },
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
