import 'package:flutter/material.dart';

const _defaultTextStyle = TextStyle(
  fontFamily: 'LuckiestGuy',
  letterSpacing: 1.5,
  height: 1.5,
);

const textTheme = TextTheme(
  displayLarge: _defaultTextStyle,
  displayMedium: _defaultTextStyle,
  displaySmall: _defaultTextStyle,
  headlineLarge: _defaultTextStyle,
  headlineMedium: _defaultTextStyle,
  headlineSmall: _defaultTextStyle,
  titleLarge: _defaultTextStyle,
  titleMedium: _defaultTextStyle,
  titleSmall: _defaultTextStyle,
  bodyLarge: _defaultTextStyle,
  bodyMedium: _defaultTextStyle,
  bodySmall: _defaultTextStyle,
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(textStyle: _defaultTextStyle),
);
