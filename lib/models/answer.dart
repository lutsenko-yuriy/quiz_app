class Answer {
  String answerText;

  Answer(this.answerText);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Answer &&
          runtimeType == other.runtimeType &&
          answerText == other.answerText;

  @override
  int get hashCode => answerText.hashCode;
}