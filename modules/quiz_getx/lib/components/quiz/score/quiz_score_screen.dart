import 'package:flutter/material.dart';
import 'package:quiz_getx/commons/commons.dart';
import 'package:quiz_getx/commons/widgets/primary_btn/primary_btn.dart';
import 'package:quiz_getx/components/quiz/ranking/ranking_widget.dart';
import 'package:quiz_getx/components/quiz/three_stat/three_stat.dart';

class QuizScoreScreen extends StatelessWidget {
  const QuizScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBrightBg() as PreferredSizeWidget,
      body: Column(
        children: [
          upperPart(),
          bottomPart(),
        ],
      ),
      bottomNavigationBar: BottomSplitNavBtn(),
    );
  }

  Widget upperPart() {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Kuis Telah Selesai!'),
          Text('Skor Kamu'),
          Text('100'),
          ThreeStat(),
          PrimaryBtn(
            title: 'Evaluasi',
            color: Colors.black,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget bottomPart() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: RankingWidget(),
    );
  }
}
