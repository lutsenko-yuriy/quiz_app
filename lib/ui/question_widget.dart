import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question _question;
  final Function _onPositiveAnswer;
  final Function _onNegativeAnswer;

  const QuestionWidget(
      this._question, this._onPositiveAnswer, this._onNegativeAnswer,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            _question.questionText,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          ..._question.answers.map((answer) {
            return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    answer == _question.correctAnswer
                        ? _onPositiveAnswer()
                        : _onNegativeAnswer();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.white))),
                  child: Text(
                    answer.answerText,
                  ),
                ));
          })
        ],
      ),
    );
  }
}
