import 'package:flutter/material.dart';

class PractiseGange extends StatefulWidget {
  const PractiseGange({Key? key}) : super(key: key);


  @override
  State<PractiseGange> createState() => _PractiseGangeState();
}

class _PractiseGangeState extends State<PractiseGange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gange'),
      ),
      body: Column(
        children: const [
          Text('Gange...'),
        ],
      ),
    );
  }
}
