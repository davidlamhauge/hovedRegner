import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mat_trainer/subject_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
            'Hovedregning',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Hvad vil du øve?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.purple,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SubjectButton(subject: 'Plus'),
                  SubjectButton(subject: 'Minus'),
                  SubjectButton(subject: 'Gange'),
                  SubjectButton(subject: 'Division'),
                ],
              ),
              const Image(image: AssetImage('assets/hovedregning.png'))
            ],
          ),
        ),
      ),
    );
  }
}
