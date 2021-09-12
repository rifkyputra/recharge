import 'package:flutter/material.dart';
import 'package:quiz_getx/commons/widgets/list_tile_secondary/list_tile_secondary.dart';

class RankingWidget extends StatelessWidget {
  const RankingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Peringkat'),
        ListView.builder(
          itemBuilder: (context, index) {
            return ListTileSecondary();
          },
        )
      ],
    );
  }
}
