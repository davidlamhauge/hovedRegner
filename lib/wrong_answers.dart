import 'package:flutter/material.dart';

class WrongAnswers extends StatefulWidget {
  const WrongAnswers({Key? key, required this.strings}) : super(key: key);

  final List<String> strings;

  @override
  State<WrongAnswers> createState() => _WrongAnswersState();
}

class _WrongAnswersState extends State<WrongAnswers> {
  String txt = '';

  _getStrings() {
    setState(() {
      for (int i = 0; i < widget.strings.length; i++) {
        txt += '${widget.strings[i]}\n';
      }
    });
  }

  @override
  void initState() {
    _getStrings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Ukorrekt(-e) svar:\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.green,
              ),
            ),
            subtitle: Text(
              txt,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
