import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kurkoruma/helper/constants.dart';
import 'package:kurkoruma/pages/home_page.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:kurkoruma/state/theme_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Calculator()),
      ChangeNotifierProvider(create: (_) => ThemeManager()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("main.dart buidl methodu");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kur Korumalı TL Mevduatı ',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<ThemeManager>().themeMode,
        home: const HomePage());
  }
}
