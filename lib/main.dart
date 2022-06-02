import 'package:flutter/material.dart';
import 'package:quiz_app/ui/question_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    if (_questionIndex >= _questions.length) {
      widgets.add(const Text("The quiz is over! Well done!"));
    } else {
      widgets.addAll(_layoutWithCurrentQuestion());
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My first page"),
          ),
          body: Column(
            children: widgets,
          )),
    );
  }

  List<Widget> _layoutWithCurrentQuestion() {
    var widgets = <Widget>[];

    if (_lastQuestionWasAnsweredCorrectly == true) {
      widgets.add(const Text("Correct! Let's proceed to the next answer!"));
    } else if (_lastQuestionWasAnsweredCorrectly == false) {
      widgets.add(const Text("Incorrect! Please try again!"));
    }

    var question = _questions[_questionIndex];

    widgets.add(QuestionWidget(
      question,
          () => _onQuestionAnsweredCorrectly(question),
          () => _onQuestionAnsweredIncorrectly(question),
    ));

    return widgets;
  }
}
