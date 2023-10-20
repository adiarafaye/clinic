import 'package:flutter/material.dart';
import 'package:rendezvous/screens/patients/appoint_patient.dart';

class Doctor {
  final String name;
  final String specialty;
  final String image;

  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
  });
}

class DoctorsSection extends StatelessWidget {
  DoctorsSection({super.key, Key});

  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Hajara",
      specialty: "Dentiste",
      image: "images/doctor1.jpg",
    ),
    Doctor(
      name: "Dr. Faye",
      specialty: "Cardiologue",
      image: "images/doctor2.jpg",
    ),
    Doctor(
      name: "Dr. Sarah",
      specialty: "Dermatologue",
      image: "images/doctor3.jpg",
    ),
    Doctor(
      name: "Dr. Marie",
      specialty: "Pédiatre",
      image: "images/doctor4.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Column(
            children: [
              Container(
                height: 200,
                width: 150,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F8FF),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppointPatient(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              doctor.image,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            doctor.specialty,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
