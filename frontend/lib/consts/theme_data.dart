import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/screens/components/customButton.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
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
                color: Color.fromARGB(255, 219, 219, 219).withOpacity(0.5))
            : TextStyle(
                color: Color.fromARGB(255, 65, 65, 65).withOpacity(0.5)),
        labelStyle: isDarkTheme
            ? TextStyle(
                color: Color.fromARGB(255, 219, 219, 219).withOpacity(0.5))
            : TextStyle(
                color: Color.fromARGB(255, 65, 65, 65).withOpacity(0.5)),
        fillColor: isDarkTheme
            ? Color.fromARGB(255, 90, 90, 90)
            : Color.fromARGB(255, 226, 226, 226),
      ),
      scaffoldBackgroundColor: isDarkTheme
          ? Color.fromARGB(255, 53, 53, 53)
          : Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDarkTheme ? Color.fromARGB(255, 53, 53, 53) : Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkTheme
              ? Color.fromARGB(255, 90, 90, 90)
              : Color.fromARGB(255, 226, 226, 226),
        ),
      ),
      cardColor: isDarkTheme
          ? Color.fromARGB(255, 90, 90, 90)
          : Color.fromARGB(255, 226, 226, 226),

      // appBarTheme: AppBarTheme(
      //   backgroundColor:
      //       isDarkTheme ? Color.fromARGB(255, 53, 53, 53) : Colors.white,
      //   elevation: 20,
      //   shadowColor: const Color.fromARGB(255, 111, 8, 143),
      //   iconTheme: isDarkTheme
      //       ? const IconThemeData(color: Colors.white)
      //       : const IconThemeData(color: Colors.black),
      //   titleTextStyle: const TextStyle(
      //     color: Color.fromARGB(200, 92, 225, 230),
      //     fontSize: 22,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),

      // primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      // backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white,
      // indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      // hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      // disabledColor: Colors.grey,
      // cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      // canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      // brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(
      //     colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white : Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme
            ? Color.fromARGB(255, 26, 26, 26)
            : Color.fromARGB(255, 255, 255, 255),
      ),
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
      //     .copyWith(secondary: Colors.deepPurple),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: isDarkTheme
              ? Color.fromARGB(211, 223, 223, 223)
              : Color.fromARGB(193, 51, 51, 51),
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
      // textSelectionTheme: TextSelectionThemeData(
      //     selectionColor: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
