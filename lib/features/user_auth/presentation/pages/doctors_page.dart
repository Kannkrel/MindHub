import 'package:flutter/material.dart';

class PsychologistsPage extends StatelessWidget {
  const PsychologistsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Psicólogos Disponibles"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: psychologistsList.length,
        itemBuilder: (context, index) {
          return _buildPsychologistProfile(context, psychologistsList[index]);
        },
      ),
    );
  }

  Widget _buildPsychologistProfile(BuildContext context, Psychologist psychologist) {
    return InkWell(
      onTap: () {
        // Acción al seleccionar un psicólogo
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromRGBO(7, 185, 159, 1),
              // Aquí puedes establecer la imagen del psicólogo si tienes la URL de la imagen
              // backgroundImage: NetworkImage(psychologist.imageUrl),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    psychologist.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    psychologist.specialization,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  psychologist.available ? "Disponible" : "No Disponible",
                  style: TextStyle(
                    color: psychologist.available ? Colors.green : Colors.red,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Agendar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Psychologist {
  final String name;
  final String specialization;
  final bool available;

  Psychologist({
    required this.name,
    required this.specialization,
    required this.available,
  });
}

// Ejemplo de lista de psicólogos
final List<Psychologist> psychologistsList = [
  Psychologist(name: "Dr. Juan Pérez", specialization: "Psicología Clínica", available: true),
  Psychologist(name: "Dra. María García", specialization: "Psicología Infantil", available: false),
  Psychologist(name: "Dr. Carlos López", specialization: "Psicología de Pareja", available: true),
  Psychologist(name: "Dra. Ana Martínez", specialization: "Psicología Organizacional", available: true),
];

void main() {
  runApp(MaterialApp(
    home: PsychologistsPage(),
  ));
}
