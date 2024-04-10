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
    specialization: 'Terapia de Conducta Cognitiva',
  ),
  Psychologist(
    name: 'Jane Smith',
    specialization: 'Terapia Familiar',
  ),
  Psychologist(
    name: 'Alice Johnson',
    specialization: 'Psicoanalista',
  ),
  Psychologist(
    name: 'Bob Brown',
    specialization: 'Terapia Humanista',
  ),
  Psychologist(
    name: 'Eve White',
    specialization: 'Terapia Gestalt',
  ),
  Psychologist(
    name: 'Charlie Black',
    specialization: 'Terapia Existencial',
  ),
  Psychologist(
    name: 'Grace Grey',
    specialization: 'Psicoanalista',
  ),
  Psychologist(
    name: 'Harry Green',
    specialization: 'Psicoanalista',
  ),
  Psychologist(
    name: 'Ivy Blue',
    specialization: 'Terapia de Conducta Cognitiva',
  ),
  Psychologist(
    name: 'Jack Red',
    specialization: 'Terapia Familiar',
  ),
  Psychologist(
    name: 'Kelly Yellow',
    specialization: 'Terapia Familiar',
  ),
  Psychologist(
    name: 'Liam Orange',
    specialization: 'Terapia Existencial',
  ),
  Psychologist(
    name: 'Mia Purple',
    specialization: 'Psiquiatra',
  ),
  Psychologist(
    name: 'Noah Pink',
    specialization: 'Psiquiatra',
  ),
  Psychologist(
    name: 'Olivia Brown',
    specialization: 'Psicólogo General',
  ),
  Psychologist(
    name: 'Oscar White',
    specialization: 'Psicólogo General',
  ),
];
