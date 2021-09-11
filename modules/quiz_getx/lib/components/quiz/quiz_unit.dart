import 'dart:async';

import 'package:get/get.dart';
import 'package:equatable/equatable.dart';

class QuizUnit extends GetxController {
  var quizStat = QuizStat().obs;
  var ranking = <String>[].obs;

  void fetchRanking() async {
    var count = 0;
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (count == 10) {
        timer.cancel();
      }

      ranking.add('Si Anggota Nomor $count');
      count++;
    });
  }

  void fetchQuizStat() async {
    await Future.delayed(Duration(seconds: 3));
    quizStat.value = QuizStat(
      enrollCount: 10,
      enrollLimit: 50,
      timeLimit: 30,
      totalQuestion: 20,
      start: DateTime.now().subtract(
        Duration(days: 1),
      ),
      ends: DateTime.now().add(
        Duration(days: 2),
      ),
    );
  }
}

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
