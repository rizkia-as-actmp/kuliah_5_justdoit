import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/heading_interface.dart';
import 'package:justdoit/src/constants/colors.dart';

class HeadingOne extends StatelessWidget implements HeadingInterface {
  @override
  final String data;
  @override
  Color color;
  @override
  TextAlign textAlign;

  HeadingOne({
    super.key,
    required this.data,
    this.color = DefinedTheme.onBackground,
    this.textAlign = TextAlign.left,
  });

  @override
  TextStyle getTextStyle() {
    return TextStyle(
      color: color,
      fontSize: 32,
      fontWeight: FontWeight.w900,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: getTextStyle(),
    );
  }
}

class HeadingTwo extends StatelessWidget implements HeadingInterface {
  @override
  final String data;
  @override
  Color color;
  @override
  TextAlign textAlign;

  HeadingTwo({
    super.key,
    required this.data,
    this.color = DefinedTheme.onBackground,
    this.textAlign = TextAlign.left,
  });

  @override
  TextStyle getTextStyle() {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w900,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: getTextStyle(),
    );
  }
}

class HeadingThree extends StatelessWidget implements HeadingInterface {
  @override
  final String data;
  @override
  Color color;
  @override
  TextAlign textAlign;

  HeadingThree({
    super.key,
    required this.data,
    this.color = DefinedTheme.onBackground,
    this.textAlign = TextAlign.left,
  });

  @override
  TextStyle getTextStyle() {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w900,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: getTextStyle(),
    );
  }
}

class HeadingFour extends StatelessWidget implements HeadingInterface {
  @override
  final String data;
  @override
  Color color;
  @override
  TextAlign textAlign;

  HeadingFour({
    super.key,
    required this.data,
    this.color = DefinedTheme.onBackground,
    this.textAlign = TextAlign.left,
  });

  @override
  TextStyle getTextStyle() {
    return TextStyle(
      color: color,
      fontSize: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: getTextStyle(),
    );
  }
}

class HeadingFive extends StatelessWidget implements HeadingInterface {
  @override
  final String data;
  @override
  Color color;
  @override
  TextAlign textAlign;

  HeadingFive({
    super.key,
    required this.data,
    this.color = DefinedTheme.onBackground,
    this.textAlign = TextAlign.left,
  });

  @override
  TextStyle getTextStyle() {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w900,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: getTextStyle(),
    );
  }
}

class HeadingSix extends StatelessWidget implements HeadingInterface {
  @override
  final String data;
  @override
  Color color;
  @override
  TextAlign textAlign;

  HeadingSix({
    super.key,
    required this.data,
    this.color = DefinedTheme.onBackground,
    this.textAlign = TextAlign.left,
  });

  @override
  TextStyle getTextStyle() {
    return TextStyle(
      color: color,
      fontSize: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: getTextStyle(),
    );
  }
}
