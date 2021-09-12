import 'package:equatable/equatable.dart';

class QuizStat extends Equatable {
  final timeLimit;
  final enrollCount;
  final enrollLimit;
  final DateTime? start;
  final DateTime? ends;
  final int? totalQuestion;

  QuizStat({
    this.timeLimit,
    this.enrollCount,
    this.enrollLimit,
    this.start,
    this.ends,
    this.totalQuestion,
  });

  @override
  List<Object?> get props => [
        timeLimit,
        enrollCount,
        enrollLimit,
        start,
        ends,
        totalQuestion,
      ];
}
