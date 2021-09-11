import 'package:flutter/material.dart';
import 'package:stylekit/stylekit.dart';

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
            headline1: TextStyleKit.extraLarge.fill(color: halfBlack),
          )),
      home: MainApp(),
      color: Colors.amber,
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
