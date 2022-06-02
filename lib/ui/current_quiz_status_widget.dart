import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/ui/question_widget.dart';

class CurrentQuizStatusWidget extends StatelessWidget {
  final Question _question;
  final Function _onCorrectAnswer;
  final Function _onIncorrectAnswer;
  final bool? _lastQuestionWasAnsweredCorrectly;

  const CurrentQuizStatusWidget(
      this._question, this._onCorrectAnswer, this._onIncorrectAnswer, this._lastQuestionWasAnsweredCorrectly,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QuestionWidget(
          _question,
          () => _onCorrectAnswer(_question),
          () => _onIncorrectAnswer(_question),
        ),
        _messageWidget(),
      ],
    );
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
