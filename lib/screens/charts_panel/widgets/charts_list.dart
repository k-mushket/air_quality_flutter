import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

class ChartsList extends StatelessWidget {
  ChartsList({super.key});

  final DatabaseReference _databaseReference = FirebaseDatabase.instance
      .ref('UsersData/NECQyPdjBbVvyFAqPRcdxQdvcJ63/readings');

  Stream<Map<dynamic, dynamic>> _readingsStream() {
    return _databaseReference.onValue.map((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as Map);
      data.removeWhere((key, value) => value is! Map);
      return data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<dynamic, dynamic>>(
      stream: _readingsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        List<Widget> readingsWidgets = [];
        snapshot.data!.forEach(
          (key, value) {
            final readingData = Map<String, String>.from(value as Map);
            readingsWidgets.add(
              Card(
                child: ListTile(
                  title: Text('Timestamp: $key'),
                  subtitle: Text(
                      'Temperature: ${readingData['temperature']}\nHumidity: ${readingData['humidity']}\nPressure: ${readingData['pressure']}'),
                ),
              ),
            );
          },
        );
        return ListView(
          children: readingsWidgets,
        );
      },
    );
  }
}
