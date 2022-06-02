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

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _lastQuestionWasAnsweredCorrectly = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    if (_questionIndex >= _questions.length) {
      widgets.add(const Text("The quiz is over! Well done!"));
      widgets.add(
        ElevatedButton(
            onPressed: _restartQuiz, child: const Text("Restart the quiz!")),
      );
    } else {
      widgets.addAll(_layoutWithCurrentQuestionAndAnswerStatus());
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

  List<Widget> _layoutWithCurrentQuestionAndAnswerStatus() {
    var widgets = <Widget>[];

    Widget? message;

    if (_lastQuestionWasAnsweredCorrectly == true) {
      message = const Text(
        "Correct! Let's proceed to the next answer!",
        style: TextStyle(backgroundColor: Colors.green),
      );
    } else if (_lastQuestionWasAnsweredCorrectly == false) {
      message = const Text(
        "Incorrect! Please try again!",
        style: TextStyle(backgroundColor: Colors.red),
      );
    }

    if (message != null) {
      widgets.add(message);
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
