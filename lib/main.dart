import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questions = [
    Question(
        "What is your name?",
        [
          Answer("Jack"),
          Answer("Jill"),
          Answer("Iurii"),
          Answer("Dazdraperma")
        ],
        Answer("Iurii")
    ),
    Question(
        "What is your quest?",
        [
          Answer("Destroy the world"),
          Answer("To seek The Holy Grail"),
          Answer("Save Hyrule"),
        ],
        Answer("To seek The Holy Grail")
    ),
    Question(
        "What is your favourite color?",
        [
          Answer("Blue"),
          Answer("Purple"),
          Answer("Orange"),
        ],
        Answer("Orange")
    ),
  ];

  var questionIndex = 0;

  void _answerQuestion(String answer) {
    setState(() {
      questionIndex++;
      print("$answer, moving to the question $questionIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My first page"),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex].questionText),
            ElevatedButton(
              onPressed: () => _answerQuestion("Answer 1 is selected"),
              child: Text("Answer 1"),
            ),
            ElevatedButton(
              onPressed: () => _answerQuestion("Answer 2 is selected"),
              child: Text("Answer 2"),
            ),
            ElevatedButton(
              onPressed: () => _answerQuestion("Answer 3 is selected"),
              child: Text("Answer 3"),
            ),
          ],
        ),
      ),
    );
  }
}
