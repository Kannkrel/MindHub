import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Psicólogos"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: psychologists.length,
        itemBuilder: (BuildContext context, int index) {
          return PsychologistCard(
            psychologist: psychologists[index],
          );
        },
      ),
    );
  }
}

class Psychologist {
  final String name;
  final String specialization;
  final String location;
  final String imageUrl;

  Psychologist({
    required this.name,
    required this.specialization,
    required this.location,
    required this.imageUrl,
  });
}

final List<Psychologist> psychologists = [
  Psychologist(
    name: "Dr. María García",
    specialization: "Psicología Clínica",
    location: "Calle Principal #123",
    imageUrl: "assets/images/maria_garcia.jpg",
  ),
  Psychologist(
    name: "Dr. Juan Martínez",
    specialization: "Terapia Familiar",
    location: "Avenida Central #456",
    imageUrl: "assets/images/juan_martinez.jpg",
  ),
  // Add more psychologists as needed
];

class PsychologistCard extends StatelessWidget {
  final Psychologist psychologist;

  const PsychologistCard({Key? key, required this.psychologist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(psychologist.imageUrl),
        ),
        title: Text(
          psychologist.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(psychologist.specialization),
            Text(psychologist.location),
          ],
        ),
        onTap: () {
          // Navigate to psychologist's profile or perform any action
        },
      ),
    );
  }
}
