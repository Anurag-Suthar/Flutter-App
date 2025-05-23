import 'package:fluter_catalog/core/store.dart';
import 'package:fluter_catalog/pages/card_page.dart';
import 'package:fluter_catalog/pages/home_details_page.dart';
import 'package:fluter_catalog/pages/home_page.dart';
import 'package:fluter_catalog/pages/login_page.dart';
import 'package:fluter_catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import './utils/routes.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp((VxState(store: AppStore(), child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: AppRoutes.homeRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.cartRoute: (context) => CardPage(),
      },
    );
  }
}
