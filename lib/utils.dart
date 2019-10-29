import 'package:flutter/material.dart';

TextStyle getCustomFontTextStyle() {
  // text style which defines a custom font
  return const TextStyle(
      // set color of text
      color: Colors.deepPurpleAccent,
      // set the font family as defined in pubspec.yaml
      fontFamily: 'Pacifico',
      // set the font weight
      fontWeight: FontWeight.w400,
      // set the font size
      fontSize: 36.0);
}

LinearGradient getCustomGradient() {
  // Define a Linear Gradient
  return LinearGradient(
      colors: [Colors.red, Colors.white],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.6, 0.0),
      stops: [0.0, 0.6],
      tileMode: TileMode.mirror);
}
