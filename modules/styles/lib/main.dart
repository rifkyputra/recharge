import 'package:flutter/material.dart';
import 'package:styles/palette.dart';
import 'package:styles/text_style_kit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyleKit.extraLarge()
                .withColor(color: Palette.halfBlack)
                .w400,
          )),
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
