import 'package:flutter/material.dart';

class PractiseScreen extends StatefulWidget {
  const PractiseScreen({Key? key, required this.subject}) : super(key: key);

  final String subject;

  @override
  State<PractiseScreen> createState() => _PractiseScreenState();
}

class _PractiseScreenState extends State<PractiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
      ),
    );
  }
}
