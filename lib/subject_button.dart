import 'package:flutter/material.dart';
import 'package:mat_trainer/practise.dart';

class SubjectButton extends StatelessWidget {
  const SubjectButton({Key? key, required this.subject }) : super(key: key);

  final String subject;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
        onPressed: () {
          PractiseScreen(subject: subject);
        },
        child: Text(subject),
    );
  }
}
