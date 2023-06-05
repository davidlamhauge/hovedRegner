import 'package:flutter/material.dart';

import 'package:mat_trainer/subjects/practise_plus.dart';
import 'package:mat_trainer/subjects/practise_minus.dart';
import 'package:mat_trainer/subjects/practise_gange.dart';
import 'package:mat_trainer/subjects/practise_division.dart';

class PractiseScreen extends StatefulWidget {
  const PractiseScreen({Key? key, required this.subject}) : super(key: key);

  final String subject;

  @override
  State<PractiseScreen> createState() => _PractiseScreenState();
}

class _PractiseScreenState extends State<PractiseScreen> {

  late Widget chosen;

  @override
  Widget build(BuildContext context) {
    switch (widget.subject) {
      case 'Plus':      chosen = const PractisePlus(); break;
      case 'Minus':     chosen = const PractiseMinus(); break;
      case 'Gange':     chosen = const PractiseGange(); break;
      case 'Division':  chosen = const PractiseDivision(); break;
      default:          chosen = const PractisePlus(); break;
    }
    return chosen;
  }
}

