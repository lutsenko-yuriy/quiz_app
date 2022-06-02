import 'answer.dart';

class Question {
  final String questionText;
  final List<Answer> answers;
  final Answer correctAnswer;

  Question(this.questionText, this.answers, this.correctAnswer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question &&
          runtimeType == other.runtimeType &&
          questionText == other.questionText &&
          answers == other.answers &&
          correctAnswer == other.correctAnswer;

  @override
  int get hashCode =>
      questionText.hashCode ^ answers.hashCode ^ correctAnswer.hashCode;

}