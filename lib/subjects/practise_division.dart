import 'package:flutter/material.dart';

class PractiseDivision extends StatefulWidget {
  const PractiseDivision({Key? key}) : super(key: key);


  @override
  State<PractiseDivision> createState() => _PractiseDivisionState();
}

class _PractiseDivisionState extends State<PractiseDivision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Division'),
      ),
      body: Column(
        children: const [
          Text('Division...'),
        ],
      ),
    );
  }
}
