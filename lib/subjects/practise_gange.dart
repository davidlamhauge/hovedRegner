import 'package:flutter/material.dart';
import 'dart:math';
import 'wrong_answers.dart';

class PractiseGange extends StatefulWidget {
  const PractiseGange({Key? key}) : super(key: key);

  @override
  State<PractiseGange> createState() => _PractiseGangeState();
}



// variables
bool _continue = true;
bool _finished = false;
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
String _getGangeQuiz() {
  tal1 = random.nextInt(10) + 1;
  tal2 = random.nextInt(10) + 1;
  correctAnswer = tal1 * tal2;
  answers.clear();
  int x = correctAnswer - random.nextInt(4);
  for (int i = x; i < x + 4; i++) {
    answers.add(i); // fill array with answer candidates
  }
  quiz = '$tal1 x $tal2';
  return quiz;
}

class _PractiseGangeState extends State<PractiseGange> {
  void _evaluateAnswer(int answer) {
    setState(() {
      if (_continue) {
        if (answer == correctAnswer) {
          yes++;
        } else {
          no++;
          wrongAnswers.add('$quiz = $answer');
          wrongAnswers.add('[Korrekt: $quiz = $correctAnswer]\n');
        }
        questNum++;
        if (questNum > 9) {
          _continue = false;
          _finished = true;
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
    _finished = false;
    wrongAnswers.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gange'),
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
                ? Column(
              children: [
                Text(
                  '${_getGangeQuiz()} ?',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 20),
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
                : Text(
              'Resultat: $yes ud af $questNum',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            _finished && wrongAnswers.isNotEmpty
                ? Container(
              color: Colors.green[100],
              height: 80,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: WrongAnswers(strings: wrongAnswers)),
            )
                : const Spacer(),
            const Image(
              image: AssetImage('assets/hovedregning.png'),
            ),
          ],
        ),
      ),
    );
  }
}
