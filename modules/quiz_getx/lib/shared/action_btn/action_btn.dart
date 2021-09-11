import 'package:flutter/material.dart';

class ActionBtn extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final void Function() onTap;

  final Widget? icon;

  final double? width;
  final double? elevation;

  const ActionBtn({
    Key? key,
    this.bgColor,
    required this.title,
    required this.onTap,
    this.width,
    this.elevation,
  })  : this.icon = null,
        super(key: key);

  const ActionBtn.long({
    Key? key,
    this.bgColor,
    required this.title,
    required this.onTap,
    this.icon,
    this.width,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: _renderChild,
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget get _renderChild {
    if (icon != null) {
      return Row(
        children: [
          Text(title),
          icon!,
        ],
      );
    }

    return Text(title);
  }
}
