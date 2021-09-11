import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    Key? key,
    this.isOutline,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final bool? isOutline;
  final String title;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    if (isOutline ?? false) {
      return OutlinedButton(
        onPressed: onTap,
        child: Text(title),
        style: OutlinedButton.styleFrom(backgroundColor: Colors.transparent),
      );
    }

    return TextButton(
      child: Text(title),
      onPressed: onTap,
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
      ),
    );
  }
}
