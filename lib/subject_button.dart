import 'package:flutter/material.dart';
import 'package:mat_trainer/practise.dart';

class SubjectButton extends StatelessWidget {
  const SubjectButton({Key? key, required this.subject }) : super(key: key);

  final String subject;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: const Size(300, 32),
      ),
        onPressed: () {
          PractiseScreen(subject: subject);
        },
        child: Text(subject),
    );
  }
}
