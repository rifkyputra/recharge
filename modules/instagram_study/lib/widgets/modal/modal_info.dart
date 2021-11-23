import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalInfo extends StatelessWidget {
  const ModalInfo({
    Key? key,
    required this.onTap,
    required this.title,
    required this.content,
  }) : super(key: key);

  final void Function() onTap;
  final String title;
  final String content;

  static Future cupertinoPopup({
    required BuildContext context,
    required void Function() onTap,
    required String title,
    required String content,
  }) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: onTap,
              child: Text('Ok'),
            ),
          ],
          content: Text(
            content,
            maxLines: 4,
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        );
      },
    );
  }

  static Future materialPopup({
    required BuildContext context,
    required void Function() onTap,
    required String title,
    required String content,
  }) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: onTap,
              child: Text('Ok'),
            ),
          ],
          content: Text(
            content,
            maxLines: 4,
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              children: [
                Text(title),
                const SizedBox(height: 8),
                Text(
                  content,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            child: SizedBox(
              height: 1,
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}
