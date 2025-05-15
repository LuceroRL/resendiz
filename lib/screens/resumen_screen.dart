import 'package:flutter/material.dart';

class ResumenScreen extends StatelessWidget {
  const ResumenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos simulados por ahora (los conectaremos después)
    final int duracionPromedio = 28;
    final int duracionMenstruacion = 5;
    final String proximaFecha = "14/05/2025";

    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen del Ciclo'),
        backgroundColor: Colors.pink.shade300,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInfoCard(
              title: 'Duración promedio del ciclo',
              value: '$duracionPromedio días',
              icon: Icons.calendar_today,
              color: Colors.pink.shade100,
            ),
            SizedBox(height: 15),
            _buildInfoCard(
              title: 'Duración promedio de la menstruación',
              value: '$duracionMenstruacion días',
              icon: Icons.water_drop_rounded,
              color: Colors.pink.shade200,
            ),
            SizedBox(height: 15),
            _buildInfoCard(
              title: 'Próxima menstruación estimada',
              value: proximaFecha,
              icon: Icons.event_available,
              color: Colors.pink.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Icon(icon, size: 36, color: Colors.pink.shade800),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text(value,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.pink.shade900,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

