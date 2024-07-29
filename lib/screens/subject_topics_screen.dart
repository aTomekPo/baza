import 'package:flutter/material.dart';
import 'main_menu_screen.dart';
import 'quiz_screen.dart';
import '../models/subject.dart';

class SubjectTopicsScreen extends StatelessWidget {
  final Subject subject;

  SubjectTopicsScreen({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Topic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Topics for ${subject.name}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(subject: subject, topic: 'Topic 1'),
                  ),
                );
              },
              child: Text('Topic 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(subject: subject, topic: 'Topic 2'),
                  ),
                );
              },
              child: Text('Topic 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(subject: subject, topic: 'Topic 3'),
                  ),
                );
              },
              child: Text('Topic 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Powrót do poprzedniego ekranu
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
