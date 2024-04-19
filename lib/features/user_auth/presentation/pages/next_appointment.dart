import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NextAppointmentPage extends StatefulWidget {
  const NextAppointmentPage({Key? key}) : super(key: key);

  @override
  State<NextAppointmentPage> createState() => _NextAppointmentPageState();
}

class _NextAppointmentPageState extends State<NextAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Próximas Citas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Text('No se encontraron datos'),
            );
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final List<dynamic> appointmentDays = data.values.toList();

          return ListView.builder(
            itemCount: appointmentDays.length,
            itemBuilder: (context, index) {
              final name = (appointmentDays[index]['psychologistName']);
              final lastname = appointmentDays[index]['psychologistlastName'];
              final date = appointmentDays[index]['date'];
              final sessionType = appointmentDays[index]['sessionType'];
              final time = appointmentDays[index]['time'];

              return ListTile(
                title: Text('Cita ${index + 1} con $name $lastname'),
                subtitle: Text('Fecha: $date - $sessionType - Hora: $time'),
              );
            },
          );
        },
      ),
    );
  }
}
