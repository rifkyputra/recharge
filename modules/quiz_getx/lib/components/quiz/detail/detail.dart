import 'package:flutter/material.dart';
import 'package:quiz_getx/commons/commons.dart';

class QuizDetail extends StatelessWidget {
  const QuizDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDarkBg() as PreferredSizeWidget,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
