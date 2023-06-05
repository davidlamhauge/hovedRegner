import 'package:flutter/material.dart';
import 'dart:math';

class PractisePlus extends StatefulWidget {
  const PractisePlus({Key? key}) : super(key: key);

  @override
  State<PractisePlus> createState() => _PractisePlusState();
}

// variables
bool _continue = true;
String quiz = '';
int tal1 = 0;
int tal2 = 0;
int yes = 0;
int no = 0;
int correctAnswer = 0;
int questNum = 0;
List<int> answers = [];
List<String> wrongAnswers = [];
Random random = Random();

// get question and initialize numbers...
String _getPlusQuiz() {
  tal1 = random.nextInt(20) + 1;
  tal2 = random.nextInt(20) + 1;
  correctAnswer = tal1 + tal2;
  answers.clear();
  int x = correctAnswer - random.nextInt(4);
  for (int i = x; i < x + 4; i++) {
    answers.add(i); // fill array with answer candidates
  }
  quiz = '$tal1 + $tal2';
  return quiz;
}

class _PractisePlusState extends State<PractisePlus> {
  void _evaluateAnswer(int answer) {
    setState(() {
      if (_continue) {
        if (answer == correctAnswer) {
          yes++;
        } else {
          no++;
          wrongAnswers.add(quiz);
        }
        questNum++;
        if (questNum > 9) {
          _continue = false;
        }
      }
    });
  }

  @override
  void initState() {
    yes = 0;
    no = 0;
    questNum = 0;
    _continue = true;
    wrongAnswers.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plus'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.thumb_up, size: 50, color: Colors.green),
                    Icon(Icons.thumb_down, size: 50, color: Colors.red),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      yes.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      no.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _continue
                ? Text(
                    '${_getPlusQuiz()} ?',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  )
                : Text(
                    'Resultat: $yes ud af $questNum',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
            const SizedBox(height: 20),
            _continue
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _evaluateAnswer(answers[0]);
                              },
                              child: Text(
                                answers[0].toString(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                _evaluateAnswer(answers[1]);
                              },
                              child: Text(
                                answers[1].toString(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _evaluateAnswer(answers[2]);
                              },
                              child: Text(
                                answers[2].toString(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                _evaluateAnswer(answers[3]);
                              },
                              child: Text(
                                answers[3].toString(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: const [
                      Text('Færdig med quizzen'),
                      Spacer(),
                    ],
                  ),
            const Image(
              image: AssetImage('assets/hovedregning.png'),
            ),
          ],
        ),
      ),
    );
  }
}
