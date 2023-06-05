import 'package:flutter/material.dart';
import 'package:mat_trainer/practise.dart';
import 'package:mat_trainer/subject_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forside',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Hvad vil du øve?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SubjectButton(subject: 'Plus'),
                  SizedBox(height: 5),
                  SubjectButton(subject: 'Minus'),
                  SizedBox(height: 5),
                  SubjectButton(subject: 'Gange'),
                  SizedBox(height: 5),
                  SubjectButton(subject: 'Division'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
