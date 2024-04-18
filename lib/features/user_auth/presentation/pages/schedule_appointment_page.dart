import 'package:flutter/material.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  final String psychologistName;

  const ScheduleAppointmentPage({Key? key, required this.psychologistName})
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
        title: Text('Agendando cita con: ${widget.psychologistName}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(7, 185, 159, 1),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text('Seleccionar Fecha'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(7, 185, 159, 1),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text('Seleccionar Hora'),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedSessionType,
                items: [
                  DropdownMenuItem(
                    child: Text('Presencial'),
                    value: 'Presencial',
                  ),
                  DropdownMenuItem(
                    child: Text('En Línea'),
                    value: 'En Línea',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedSessionType = value!;
                  });
                },
                hint: Text('Seleccionar Tipo de Sesión'),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 40,
                iconEnabledColor: Color.fromRGBO(7, 185, 159, 1),
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
