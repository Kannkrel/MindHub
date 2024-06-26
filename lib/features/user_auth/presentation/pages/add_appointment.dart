import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart' show Uuid;

class AddAppointmentPage extends StatefulWidget {
  const AddAppointmentPage({Key? key}) : super(key: key);

  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  TimeOfDay? time;
  DateTime? _selectedDay;
  User? user = FirebaseAuth.instance.currentUser;
  String? selectedValue;
  List<String> psychologists = [];

  @override
  void initState() {
    super.initState();
    loadPsychologists();
  }

  void loadPsychologists() async {
    final psychologistsSnapshot = await FirebaseFirestore.instance.collection('psychologists').get();
    setState(() {
      psychologists = psychologistsSnapshot.docs.map<String>((doc) => '${doc['nombre']} ${doc['apellido']}' as String).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    String weekDay = _selectedDay != null
        ? DateFormat('EEEE').format(_selectedDay!)
        : 'Dia de la semana';
    String month =
    _selectedDay != null ? DateFormat('MMMM').format(_selectedDay!) : 'MM';
    String day =
    _selectedDay != null ? DateFormat('d').format(_selectedDay!) : 'DD';
    String year =
    _selectedDay != null ? DateFormat('y').format(_selectedDay!) : 'YYYY';
    String hour = time?.hour.toString() ?? 'Hora';
    String minute = time?.minute.toString() ?? 'Minuto';

    String usuario = user!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Cita con el Psicólogo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Fechas de la cita:',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$year/$month/$day',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                Text(
                  weekDay,
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                Text(
                  '$hour:$minute',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const Text('Selecciona un el psicólogo',
                    style: TextStyle(fontSize: 20.0)),
                DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  items: psychologists.map((String psychologist) {
                    return DropdownMenuItem(
                      value: psychologist,
                      child: Text(psychologist),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20.0),
                TableCalendar(
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    titleTextFormatter: (date, locale) =>
                        DateFormat.yMMM(locale).format(date),
                    formatButtonVisible: false,
                  ),
                  calendarStyle: const CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Color.fromRGBO(7, 185, 159, 1),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Color.fromRGBO(7, 185, 158, 0.506),
                      shape: BoxShape.circle,
                    ),
                  ),
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    sendAppointmentData(context, time, weekDay, day, month,
                        year, hour, minute, usuario, selectedValue);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: const Text(
                    'Agregar Cita',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showTimePicker(
            context: context,
            initialTime: time ?? TimeOfDay.now(),
          ).then((value) {
            if (value != null) {
              setState(() {
                time = value;
              });
            }
          });
        },
        child: const Icon(Icons.access_time, color: Colors.white),
      ),
    );
  }
}

void sendAppointmentData(context, time, weekDay, day, month, year, hour, minute,
    usuario, selectedValue) {
  final db = FirebaseFirestore.instance;
  hideCurrentSnackBar(context);
  if (selectedValue != null &&
      time != null &&
      weekDay != null &&
      day != null &&
      month != null &&
      year != null &&
      hour != null &&
      minute != null &&
      usuario != null) {
    Map<String, dynamic> appointmentData = {
      'minute': minute,
      'hour': hour,
      'day': day,
      'month': month,
      'year': year,
      'weekDay': weekDay,
      'namePsicologo': selectedValue,
    };

    DocumentReference<Map<String, dynamic>> docDataSend =
    db.collection('appointments').doc(usuario);

    docDataSend
        .set({const Uuid().v4(): appointmentData}, SetOptions(merge: true));
    Navigator.pop(context);
  } else {
    showSnackBar(context, 'Rellene todos los campos.');
    print('No se pudo agregar la cita');
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

void hideCurrentSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
