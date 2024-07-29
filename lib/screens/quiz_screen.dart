import 'package:flutter/material.dart';
import 'main_menu_screen.dart';
import '../models/subject.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  final Subject subject;
  final String topic;

  QuizScreen({required this.subject, required this.topic});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  List<Question> _questions = [
    Question(
      question: 'Pytanie 1',
      options: ['A', 'B', 'C', 'D'],
      correctAnswer: 'A',
    ),
    Question(
      question: 'Pytanie 2',
      options: ['A', 'B', 'C', 'D'],
      correctAnswer: 'A',
    ),
    Question(
      question: 'Pytanie 3',
      options: ['A', 'B', 'C', 'D'],
      correctAnswer: 'A',
    ),
    // Dodaj więcej pytań w ten sam sposób
  ];
  String? _selectedAnswer;
  bool _showCorrectAnswer = false;

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${_currentIndex + 1}: ${currentQuestion.question}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Column(
              children: currentQuestion.options.map((option) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedAnswer = option;
                      _showCorrectAnswer = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _showCorrectAnswer && option == currentQuestion.correctAnswer ? Colors.green : null,
                  ),
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_selectedAnswer == currentQuestion.correctAnswer) {
                    _showCorrectAnswer = true;
                  }
                });
              },
              child: Text('Check Answer'),
            ),
            SizedBox(height: 20),
            if (_showCorrectAnswer)
              Text(
                _selectedAnswer == currentQuestion.correctAnswer
                    ? 'Correct Answer!'
                    : 'Incorrect Answer. Correct Answer is ${currentQuestion.correctAnswer}',
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentIndex++;
                  _selectedAnswer = null;
                  _showCorrectAnswer = false;
                });
              },
              child: Text('Next Question'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Powrót do poprzedniego ekranu
              },
              child: Text('Back to Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
