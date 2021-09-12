import 'dart:async';

import 'package:get/get.dart';
import 'quiz_stat.dart';

import 'ranking/ranking.dart';

class QuizUnit extends GetxController {
  var quizStat = QuizStat().obs;
  var ranking = RankingList().obs;

  // void fetchRanking() async {
  //   ranking.
  // }

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
