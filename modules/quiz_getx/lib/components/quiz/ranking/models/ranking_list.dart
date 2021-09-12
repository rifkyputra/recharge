import 'package:get/get.dart';
import 'package:quiz_getx/components/quiz/ranking/ranking.dart';

class RankingList extends GetxController {
  var ranks = <RankingItem>[].obs;

  void fetchRankingList() {
    //   var count = 0;
    //   Timer.periodic(Duration(seconds: 2), (timer) {
    //     if (count == 10) {
    //       timer.cancel();
    //     }

    //     ranking.add('Si Anggota Nomor $count');
    //     count++;
    //   });
  }
}
