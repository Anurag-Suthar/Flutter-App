import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    hintColor: darkBluishColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    buttonTheme: ButtonThemeData(
      buttonColor: darkBluishColor,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: Theme.of(context).textTheme,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    fontFamily: GoogleFonts.poppins().fontFamily,
    hintColor: Colors.white,
    textTheme: Theme.of(context).textTheme,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    buttonTheme: ButtonThemeData(
      buttonColor: lightBluishColor,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  // Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;

  static Color getButtonColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    print("is dark  $isDark ${Theme.of(context).brightness}");
    return isDark ? lightBluishColor : darkBluishColor;
  }
}
