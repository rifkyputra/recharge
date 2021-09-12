import 'package:flutter/material.dart';
import 'package:quiz_getx/commons/commons.dart';
import 'package:quiz_getx/commons/widgets/list_tile_secondary/list_tile_secondary.dart';
import 'package:quiz_getx/commons/widgets/pill_line/pill_line_widget.dart';

class QuizSheetScreen extends StatelessWidget {
  const QuizSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBrightBg() as PreferredSizeWidget,
      body: Column(
        children: [
          upperPart(),
          mainPart(),
        ],
      ),
    );
  }

  Widget upperPart() {
    return Column(
      children: [
        Text('Ujian Kalkulus 1'),
        PillLineWidget(),
        Text('Sisa Waktu '),
        Text('20:21'),
        Row(
          children: [
            Text('5 Terjawab'),
            Text('10 / 20'),
          ],
        )
      ],
    );
  }

  Widget mainPart() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('10'),
          Text('Berikut Ini Pernyataan Yang Tidak Benar Adalah ?'),
          buildListAnswer(),
        ],
      ),
    );
  }

  Widget buildListAnswer() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return ListTileSecondary();
      },
    );
  }
}
