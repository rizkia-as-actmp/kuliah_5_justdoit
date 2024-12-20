import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/colors.dart';

class HeadingOne extends StatelessWidget {
  final String data;
  Color color;

  HeadingOne({
    super.key,
    required this.data,
    this.color = DefinedTheme.onBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
