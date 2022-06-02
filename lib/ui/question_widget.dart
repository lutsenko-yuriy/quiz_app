import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question _question;
  final Function _onPositiveAnswer;
  final Function _onNegativeAnswer;

  const QuestionWidget(this._question,
      this._onPositiveAnswer,
      this._onNegativeAnswer,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(Text(_question.questionText, textWidthBasis: TextWidthBasis.longestLine,));
    widgets.addAll(
        _question.answers.map((answer) {
          return ElevatedButton(
            onPressed: () {
              answer == _question.correctAnswer
                  ? _onPositiveAnswer()
                  : _onNegativeAnswer();
            },
            child: Text(answer.answerText),
          );
        })
    );
    return Column(children: widgets,);
  }
}
