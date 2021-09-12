import 'answer.dart';

class Question {
  final String id;
  final String group;
  final String title;
  final String type;

  final List<Map<AnswerId, String>> options;

  Question(this.id, this.group, this.title, this.type, this.options);
}
