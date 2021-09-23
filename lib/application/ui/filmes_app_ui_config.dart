import 'dart:ui';

import 'package:flutter/material.dart';

class FilmesAppUIConfig{
  FilmesAppUIConfig._();

  static String get title => 'Filmes App';

  static ThemeData get theme => ThemeData(
      fontFamily: 'Metropolis',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Color(0xff222222),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      )
  );
}