import 'answer.dart';

class Question {
  String questionText;
  List<Answer> answers;
  Answer correctAnswer;

  Question(this.questionText, this.answers, this.correctAnswer);
}