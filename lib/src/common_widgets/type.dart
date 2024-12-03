import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/colors.dart';

/// HeadingOne Widget
///
/// A customizable text widget for large headings.
///
/// **Parameters:**
/// - `data` (required): The text to display.
/// - `color`: The color of the text. Defaults to `DefinedTheme.onBackground`.
///
/// **Style:**
/// - Font size: 32
/// - Font weight: w900 (boldest)
///
/// Example usage:
/// ```dart
/// HeadingOne(
///   data: 'Welcome',
///   color: Colors.blue,
/// )
/// ```
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

/// HeadingTwo Widget
///
/// A customizable text widget for medium-large headings.
///
/// **Parameters:**
/// - `data` (required): The text to display.
/// - `color`: The color of the text. Defaults to `DefinedTheme.onBackground`.
///
/// **Style:**
/// - Font size: 24
/// - Font weight: w900 (boldest)
///
/// Example usage:
/// ```dart
/// HeadingTwo(
///   data: 'Hello World',
///   color: Colors.red,
/// )
/// ```
class HeadingTwo extends StatelessWidget {
  final String data;
  Color color;

  HeadingTwo({
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
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

/// HeadingThree Widget
///
/// A customizable text widget for medium-sized headings.
///
/// **Parameters:**
/// - `data` (required): The text to display.
/// - `color`: The color of the text. Defaults to `DefinedTheme.onBackground`.
///
/// **Style:**
/// - Font size: 16
/// - Font weight: w900 (boldest)
///
/// Example usage:
/// ```dart
/// HeadingThree(
///   data: 'Section Title',
///   color: Colors.green,
/// )
/// ```
class HeadingThree extends StatelessWidget {
  final String data;
  Color color;

  HeadingThree({
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
        fontSize: 16,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

/// HeadingFour Widget
///
/// A customizable text widget for small headings or subheadings.
///
/// **Parameters:**
/// - `data` (required): The text to display.
/// - `color`: The color of the text. Defaults to `DefinedTheme.onBackground`.
///
/// **Style:**
/// - Font size: 16
/// - Font weight: Normal
///
/// Example usage:
/// ```dart
/// HeadingFour(
///   data: 'Subheading',
///   color: Colors.grey,
/// )
/// ```
class HeadingFour extends StatelessWidget {
  final String data;
  Color color;

  HeadingFour({
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
        fontSize: 16,
      ),
    );
  }
}

class HeadingFive extends StatelessWidget {
  final String data;
  Color color;

  HeadingFive({
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
        fontSize: 14,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class HeadingSix extends StatelessWidget {
  final String data;
  Color color;

  HeadingSix({
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
        fontSize: 14,
      ),
    );
  }
}
