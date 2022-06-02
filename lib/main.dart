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
      widgets.addAll(_layoutWithQuizOver());
    } else {
      widgets.addAll(_layoutWithCurrentQuestionAndAnswerStatus());
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My first page"),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widgets,
            ),
          )),
    );
  }

  List<Widget> _layoutWithQuizOver() {
    return [
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          "The quiz is over! Well done!",
          style: TextStyle(
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
              onPressed: _restartQuiz,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  "Restart the quiz!",
                  style: TextStyle(fontSize: 24),
                ),
              )
          )
      ),
    ];
  }

  List<Widget> _layoutWithCurrentQuestionAndAnswerStatus() {
    var widgets = <Widget>[];

    var question = _questions[_questionIndex];

    widgets.add(Flexible(
        flex: 1,
        child: QuestionWidget(
          question,
              () => _onQuestionAnsweredCorrectly(question),
              () => _onQuestionAnsweredIncorrectly(question),
        )));

    var messageWidget = _messageWidget();

    widgets.add(
      Flexible(
        child: messageWidget,
      ),
    );

    return widgets;
  }

  Widget _messageWidget() {
    Widget? message;
    Color? backgroundColor;

    if (_lastQuestionWasAnsweredCorrectly == true) {
      backgroundColor = Colors.green;
      message = const Text(
        "Correct! Let's proceed to the next answer!",
        style: TextStyle(
          backgroundColor: Colors.green,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      );
    } else if (_lastQuestionWasAnsweredCorrectly == false) {
      backgroundColor = Colors.red;
      message = const Text(
        "Incorrect! Please try again!",
        style: TextStyle(
          backgroundColor: Colors.red,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      );
    }
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: const EdgeInsets.all(10),
      child: FittedBox(
        fit: BoxFit.contain,
        child: message,
      ),
    );
  }
}
