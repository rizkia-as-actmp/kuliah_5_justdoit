import 'dart:ui';

import 'package:flutter/material.dart';

Color addColorLightness(Color color, double amount) {
  assert(
      amount >= -1.0 && amount <= 1.0, 'Amount should be between -1.0 and 1.0');

  final hslColor = HSLColor.fromColor(color);
  final newLightness = (hslColor.lightness + amount).clamp(0.0, 1.0);

  return hslColor.withLightness(newLightness).toColor();
}

Color addSaturation(Color color, double amount) {
  assert(
      amount >= -1.0 && amount <= 1.0, 'Amount should be between -1.0 and 1.0');

  final hslColor = HSLColor.fromColor(color);
  final newSaturation = (hslColor.saturation + amount).clamp(0.0, 1.0);

  return hslColor.withSaturation(newSaturation).toColor();
}
