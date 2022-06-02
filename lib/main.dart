import 'package:flutter/material.dart';
import 'package:quiz_app/ui/current_quiz_status_widget.dart';
import 'package:quiz_app/ui/result_widget.dart';
import 'models/question.dart';
import 'models/answer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    Question(
        "What is your name?",
        [
          Answer("Jack"),
          Answer("Jill"),
          Answer("Iurii"),
          Answer("Dazdraperma")
        ],
        Answer("Iurii")),
    Question(
        "What is your quest?",
        [
          Answer("Destroy the world"),
          Answer("To seek The Holy Grail"),
          Answer("Save Hyrule"),
        ],
        Answer("To seek The Holy Grail")),
    Question(
        "What is your favourite color?",
        [
          Answer("Blue"),
          Answer("Purple"),
          Answer("Orange"),
        ],
        Answer("Orange")),
  ];

  var _questionIndex = 0;

  bool? _lastQuestionWasAnsweredCorrectly;

  void _onQuestionAnsweredCorrectly(Question question) {
    setState(() {
      _questionIndex++;
      _lastQuestionWasAnsweredCorrectly = true;
    });
  }

  void _onQuestionAnsweredIncorrectly(Question question) {
    setState(() {
      _lastQuestionWasAnsweredCorrectly = false;
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _lastQuestionWasAnsweredCorrectly = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My first page"),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _questionIndex >= _questions.length
                ? ResultWidget(_restartQuiz)
                : CurrentQuizStatusWidget(
                    _questions[_questionIndex],
                    _onQuestionAnsweredCorrectly,
                    _onQuestionAnsweredIncorrectly,
                    _lastQuestionWasAnsweredCorrectly),
          )),
    );
  }
}
