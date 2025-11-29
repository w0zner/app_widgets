import 'package:flutter/material.dart';

const colorList = <Color>[
  Color.fromRGBO(244, 67, 54, 1),
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.cyan,
  Colors.amber,
];

class AppTheme {
  final int selectedColor;

  //Inicializamos el color seleccionado por defecto en 0
  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor < colorList.length,
        'selectedColor debe estar entre 0 y ${colorList.length - 1}',
      );

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: colorList[selectedColor]),
      appBarTheme: const AppBarTheme(centerTitle: true),
    );
  }

  Color get primaryColor => colorList[selectedColor];
}
