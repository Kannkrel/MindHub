import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchAssociatedPage extends StatelessWidget {
  const SearchAssociatedPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psicólogos Asociados'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('psychologists').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          final psychologists = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Psychologist(
              name: data['nombre'] ?? '',
              specialization: data['especializacion'] ?? '', lastName: data['apellido'] ?? '', // Modificación para incluir el apellido
            );
          }).toList();
          return ListView.builder(
            itemCount: psychologists.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/user_icon_green.png'),
                ),
                title: Text('${psychologists[index].name} ${psychologists[index].lastName}'), // Mostrar nombre y apellido
                subtitle: Text(psychologists[index].specialization),
                onTap: () {
                  // Handle psychologist selection
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Psychologist {
  final String name;
  final String lastName; // Nuevo campo para el apellido
  final String specialization;

  Psychologist({
    required this.name,
    required this.lastName, // Modificación para incluir el apellido
    required this.specialization,
  });
}

