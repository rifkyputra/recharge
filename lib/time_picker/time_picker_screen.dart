import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Widget _leftSelectionOverlay =
    CupertinoPickerDefaultSelectionOverlay(capRightEdge: false);
const Widget _centerSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(
    capLeftEdge: false, capRightEdge: false);
const Widget _rightSelectionOverlay =
    CupertinoPickerDefaultSelectionOverlay(capLeftEdge: false);

class TimePickerScreen extends StatelessWidget {
  const TimePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text('Cupertino time picker'),
        Column(children: [
          Text('Calendar '),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: SizedBox(
                    height: 200,
                    child: CupertinoPicker(
                      itemExtent: 50,
                      onSelectedItemChanged: (int value) {
                        print(value);
                      },
                      selectionOverlay: _leftSelectionOverlay,
                      children: List.generate(
                          24, (index) => Center(child: Text('$index'))),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: SizedBox(
                    height: 200,
                    child: CupertinoPicker(
                      itemExtent: 50,
                      offAxisFraction: .10,
                      onSelectedItemChanged: (int value) {
                        print(value);
                      },
                      selectionOverlay: _rightSelectionOverlay,
                      children: List.generate(
                          5, (index) => Center(child: Text('${index + 1}0'))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime value) {},
            ),
          ),
        ]),
      ]),
    );
  }
}
