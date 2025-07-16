import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  //theam
  brightness: Brightness.light,
  //color scheam
  colorScheme: ColorScheme.light(surface: Colors.grey),
);

ThemeData dartkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 65, 10, 75),
  ),
);
