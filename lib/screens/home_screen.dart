import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> diasMenstruacion = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario del Ciclo'),
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.pink.shade200,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;

                // Marcar/desmarcar días de menstruación
                if (diasMenstruacion.contains(selectedDay)) {
                  diasMenstruacion.remove(selectedDay);
                } else {
                  diasMenstruacion.add(selectedDay);
                }
              });
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, _) {
                if (diasMenstruacion.contains(day)) {
                  return Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.red.shade800),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            _selectedDay != null
                ? 'Seleccionaste: ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}'
                : 'Selecciona un día para marcar menstruación',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
