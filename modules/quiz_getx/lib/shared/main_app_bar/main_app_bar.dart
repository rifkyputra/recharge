import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key, required this.onSearchPressed}) : super(key: key);

  final void Function() onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.ac_unit),
      title: Text('SemangkaKuis',
          style: Theme.of(context)
              .appBarTheme
              .textTheme
              ?.headline1
              ?.copyWith(color: Colors.white)),
      backgroundColor: Colors.red,
      toolbarHeight: 200,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearchPressed,
        )
      ],
    );
  }
}
