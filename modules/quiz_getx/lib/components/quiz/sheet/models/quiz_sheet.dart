import 'package:quiz_getx/commons/models/person/person.dart';

import '../../question.dart';
import '../../quiz_stat.dart';

class QuizSheet {
  final String id, title, description;

  final QuizStat stat;
  final List<Question> questions;
  final List<Person> admins;
  final List<Person> participants;

  QuizSheet(
    this.id,
    this.title,
    this.description,
    this.stat,
    this.questions,
    this.admins,
    this.participants,
  );
}
