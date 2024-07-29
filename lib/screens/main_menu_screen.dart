import 'package:flutter/material.dart';
import 'subject_topics_screen.dart';
import '../models/subject.dart';

class MainMenuScreen extends StatelessWidget {
  final List<Subject> subjects = [
    Subject('Polski'),
    Subject('Biologia'),
    Subject('Geografia'),
    Subject('Historia'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: subjects.map((subject) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubjectTopicsScreen(subject: subject),
                ),
              );
            },
            child: Card(
              child: Center(
                child: Text(
                  subject.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
