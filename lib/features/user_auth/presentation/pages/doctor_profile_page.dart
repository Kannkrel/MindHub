import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/schedule_appointment_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/search_associated.dart';

class PsychologistProfilePage extends StatelessWidget {
  final Psychologist psychologist; // Agrega el psicólogo como argumento al constructor

  const PsychologistProfilePage({Key? key, required this.psychologist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Psicólogo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/psychologist_image.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            Center( // Centra el nombre en la pantalla
              child: Text('Lic. '+
                  '${psychologist.name} ${psychologist.lastName}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.psychology,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  '${psychologist.specialization}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.description,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  '${psychologist.description}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  'Ubicación: ${psychologist.location}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.attach_money,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  'Precio por sesión: '+'MXN '+'${psychologist.price}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  'Sesión presencial',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  'Sesión en línea',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Lógica para enviar un mensaje al psicólogo
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(7, 185, 159, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 200, // Ancho mayor para el botón "Enviar Mensaje"
                        height: 55,
                        child: Center(
                          child: Text(
                            "Enviar Mensaje",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScheduleAppointmentPage(
                          psychologistName: psychologist.name,
                          ),
                        ),
                      );
                    },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(7, 185, 159, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 200, // Ancho mayor para el botón "Agendar Cita"
                        height: 55,
                        child: Center(
                          child: Text(
                            "Agendar Cita",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Lógica para guardar el perfil del psicólogo
                  },
                  icon: Icon(Icons.favorite_border),
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                const SizedBox(width: 10),
                Text(
                  'Guardar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(7, 185, 159, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Próximas Citas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(7, 185, 159, 1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'No hay citas agendadas por el momento.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
