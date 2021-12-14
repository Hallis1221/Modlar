import 'package:flutter/material.dart';

extension SetTextSize on TextStyle? {
  TextStyle setSize(int newSize) {
    return TextStyle(
      background: this!.background,
      backgroundColor: this!.backgroundColor,
      color: this!.color,
      debugLabel: this!.debugLabel,
      decoration: this!.decoration,
      decorationColor: this!.decorationColor,
      decorationStyle: this!.decorationStyle,
      decorationThickness: this!.decorationThickness,
      fontFamily: this!.fontFamily,
      fontFamilyFallback: this!.fontFamilyFallback,
      fontFeatures: this!.fontFeatures,
      fontSize: newSize.toDouble(),
      fontStyle: this!.fontStyle,
      fontWeight: this!.fontWeight,
      foreground: this!.foreground,
      height: this!.height,
      inherit: this!.inherit,
      leadingDistribution: this!.leadingDistribution,
      letterSpacing: this!.letterSpacing,
      locale: this!.locale,
      shadows: this!.shadows,
      textBaseline: this!.textBaseline,
      wordSpacing: this!.wordSpacing,
    );
  }
}
