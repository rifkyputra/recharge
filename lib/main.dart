import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recharge/time_picker/time_picker_screen.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Widgets'),
                WidgetSelectItem(
                  title: '1. Time Picker (Cupertino Style)',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TimePickerScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class WidgetSelectItem extends StatelessWidget {
  const WidgetSelectItem({Key? key, required this.title, this.onTap})
      : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: InkWell(
          child: Text('$title'),
          onTap: onTap,
        ));
  }
}
