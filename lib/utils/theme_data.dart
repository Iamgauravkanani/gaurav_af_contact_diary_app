import 'package:flutter/material.dart';

class ThemeDetails {
  ThemeData lightTheme = ThemeData(
      // textTheme: TextTheme(
      //     displayLarge: TextStyle(
      //         color: Colors.indigo,
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold)),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.yellow,
      )
      // colorScheme: ColorScheme.light(
      //   brightness: Brightness.light,
      //   primary: Colors.redAccent,
      //   secondary: Colors.blueGrey,
      // ),
      );
}
