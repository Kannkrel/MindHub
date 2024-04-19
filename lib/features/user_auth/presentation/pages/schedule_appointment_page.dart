import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  final String psychologistName;
  final String psychologistlastName;

  const ScheduleAppointmentPage({Key? key, required this.psychologistName, required this.psychologistlastName})
      : super(key: key);

  @override
  _ScheduleAppointmentPageState createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  late String _selectedSessionType;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
    _selectedSessionType = 'Presencial';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar cita'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Agendar cita nueva con:', style: TextStyle(fontSize: 20)),
              Text('${widget.psychologistName}'+' '+'${widget.psychologistlastName}',
                  style:
                  TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.now().subtract(Duration(days: 365)),
                lastDay: DateTime.now().add(Duration(days: 365)),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Color.fromRGBO(7, 185, 159, 1),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () => _selectTime(context),
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 150,
                    height: 55,
                    child: Center(
                      child: Text(
                        "Seleccionar Hora",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text(
                        'Presencial',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      value: 'Presencial',
                      groupValue: _selectedSessionType,
                      onChanged: (value) {
                        setState(() {
                          _selectedSessionType = value!;
                        });
                      },
                      dense: true,
                      activeColor: Color.fromRGBO(7, 185, 159, 1),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text(
                        'En Línea',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      value: 'En Línea',
                      groupValue: _selectedSessionType,
                      onChanged: (value) {
                        setState(() {
                          _selectedSessionType = value!;
                        });
                      },
                      dense: true,
                      activeColor: Color.fromRGBO(7, 185, 159, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  sendAppointmentData(context);
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 250,
                    height: 55,
                    child: Center(
                      child: Text(
                        "Confirmar",
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
            ],
          ),
        ),
      ),
    );
  }

  void sendAppointmentData(BuildContext context) async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    // Obtener el documento del usuario
    final userDoc = await db.collection('Users').doc(user!.uid).get();

    // Extraer el nombre y el apellido del documento del usuario
    final userName = userDoc['nombre'];
    final userLastName = userDoc['apellido'];

    final appointmentData = {
      'date': _selectedDate.toString(),
      'time': _selectedTime.format(context),
      'psychologistName': widget.psychologistName,
      'psychologistlastName': widget.psychologistlastName,
      'sessionType': _selectedSessionType,
      'userId': user.uid,
      'userName': userName, // Guardar solo el nombre del usuario
      'userLastName': userLastName, // Guardar solo el apellido del usuario
    };

    // Utilizar el UID del usuario como nombre del documento en la colección
    db.collection('appointments').doc(user.uid).set(appointmentData).then((value) {
      // Éxito al agregar la cita a la base de datos
      Navigator.pop(context); // Cerrar la vista de agendar cita
    }).catchError((error) {
      // Manejar el error al agregar la cita
      print("Error al agregar la cita: $error");
      showSnackBar(context, 'Error al agregar la cita. Inténtalo de nuevo.');
    });
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
}
