import 'package:equatable/equatable.dart';
import 'package:quiz_getx/commons/models/person/person.dart';

class RankingItem extends Equatable {
  final Person person;
  final int score;

  RankingItem({
    required this.person,
    required this.score,
  });

  @override
  List<Object?> get props => [
        person,
        score,
      ];
}
