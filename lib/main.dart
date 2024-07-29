import 'package:flutter/material.dart';
import 'screens/main_menu_screen.dart';

void main() {
  runApp(TeacherApp());
}

class TeacherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher',
      home: MainMenuScreen(),
    );
  }
}
