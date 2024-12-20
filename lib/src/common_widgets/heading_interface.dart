import 'package:flutter/material.dart';

abstract interface class HeadingInterface {
  String get data;
  Color get color;
  TextAlign get textAlign;

  TextStyle getTextStyle();
}
