typedef AnswerId = String;

class Answer {
  final String id;
  final String questionId;
  final String answeredBy;
  final AnswerId answer;

  Answer(
    this.id,
    this.questionId,
    this.answeredBy,
    this.answer,
  );
}
