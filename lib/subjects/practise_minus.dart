import 'package:flutter/material.dart';

class PractiseMinus extends StatefulWidget {
  const PractiseMinus({Key? key}) : super(key: key);


  @override
  State<PractiseMinus> createState() => _PractiseMinusState();
}

class _PractiseMinusState extends State<PractiseMinus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minus'),
      ),
      body: Column(
        children: const [
          Text('Minus...'),
        ],
      ),
    );
  }
}
