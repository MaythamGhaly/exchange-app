import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/components/customButton.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      dividerTheme: DividerThemeData(
        color: isDarkTheme
            ? const Color.fromARGB(255, 104, 104, 104)
            : const Color.fromARGB(255, 224, 224, 224),
      ),
      tabBarTheme: TabBarTheme(
        indicator: ShapeDecoration(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            color: isDarkTheme
                ? const Color.fromARGB(255, 104, 104, 104)
                : const Color.fromARGB(255, 224, 224, 224)),
      ),
      listTileTheme: ListTileThemeData(
        textColor: isDarkTheme ? Colors.white : Colors.black,
        iconColor: isDarkTheme ? Colors.white : Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
              width: 1, color: Color.fromARGB(200, 92, 225, 230)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
              width: 1, color: Color.fromARGB(200, 92, 225, 230)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
              width: 1, color: Color.fromARGB(200, 92, 225, 230)),
        ),
        hintStyle: isDarkTheme
            ? TextStyle(
                color:
                    const Color.fromARGB(255, 219, 219, 219).withOpacity(0.5))
            : TextStyle(
                color: const Color.fromARGB(255, 65, 65, 65).withOpacity(0.5)),
        labelStyle: isDarkTheme
            ? TextStyle(
                color:
                    const Color.fromARGB(255, 219, 219, 219).withOpacity(0.5))
            : TextStyle(
                color: const Color.fromARGB(255, 65, 65, 65).withOpacity(0.5)),
        fillColor: isDarkTheme
            ? const Color.fromARGB(255, 90, 90, 90)
            : const Color.fromARGB(255, 226, 226, 226),
      ),
      scaffoldBackgroundColor: isDarkTheme
          ? Color.fromARGB(255, 31, 31, 31)
          : const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDarkTheme ? Color.fromARGB(255, 37, 37, 37) : Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkTheme
              ? const Color.fromARGB(255, 90, 90, 90)
              : const Color.fromARGB(255, 226, 226, 226),
        ),
      ),
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 90, 90, 90)
          : const Color.fromARGB(255, 226, 226, 226),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white : Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme
            ? const Color.fromARGB(255, 26, 26, 26)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: isDarkTheme
              ? const Color.fromARGB(211, 223, 223, 223)
              : const Color.fromARGB(193, 51, 51, 51),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        button: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
