import 'package:flutter/material.dart';

class SearchAssociatedPage extends StatelessWidget {
  const SearchAssociatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psicólogos Asociados'),
      ),
      body: ListView.builder(
        itemCount: psychologists.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/user_icon_green.png'),
            ),
            title: Text(psychologists[index].name),
            subtitle: Text(psychologists[index].specialization),
            onTap: () {
              // Handle psychologist selection
            },
          );
        },
      ),
    );
  }
}

class Psychologist {
  final String name;
  final String specialization;

  Psychologist({
    required this.name,
    required this.specialization,
  });
}

const String url = "assets/user_icon_green.png";

List<Psychologist> psychologists = [
  Psychologist(
    name: 'John Doe',
    specialization: 'Cognitive Behavioral Therapy',
  ),
  Psychologist(
    name: 'Jane Smith',
    specialization: 'Family Therapy',
  ),
  Psychologist(
    name: 'Alice Johnson',
    specialization: 'Psychoanalysis',
  ),
  Psychologist(
    name: 'Bob Brown',
    specialization: 'Humanistic Therapy',
  ),
  Psychologist(
    name: 'Eve White',
    specialization: 'Gestalt Therapy',
  ),
  Psychologist(
    name: 'Charlie Black',
    specialization: 'Existential Therapy',
  ),
  Psychologist(
    name: 'Grace Grey',
    specialization: 'Person-Centered Therapy',
  ),
  Psychologist(
    name: 'Harry Green',
    specialization: 'Solution-Focused Therapy',
  ),
  Psychologist(
    name: 'Ivy Blue',
    specialization: 'Narrative Therapy',
  ),
  Psychologist(
    name: 'Jack Red',
    specialization: 'Art Therapy',
  ),
  Psychologist(
    name: 'Kelly Yellow',
    specialization: 'Music Therapy',
  ),
  Psychologist(
    name: 'Liam Orange',
    specialization: 'Drama Therapy',
  ),
  Psychologist(
    name: 'Mia Purple',
    specialization: 'Dance Therapy',
  ),
  Psychologist(
    name: 'Noah Pink',
    specialization: 'Play Therapy',
  ),
  Psychologist(
    name: 'Olivia Brown',
    specialization: 'Animal-Assisted Therapy',
  ),
  Psychologist(
    name: 'Oscar White',
    specialization: 'Ecopsychology',
  ),
];
