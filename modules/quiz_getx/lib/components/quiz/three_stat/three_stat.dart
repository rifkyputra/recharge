import 'package:flutter/material.dart';
import 'package:quiz_getx/commons/widgets/info_stat/info_stat.dart';

class ThreeStat extends StatelessWidget {
  const ThreeStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoStat(),
        InfoStat(),
        InfoStat(),
      ],
    );
  }
}
