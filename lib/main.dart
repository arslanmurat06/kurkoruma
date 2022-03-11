import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kurkoruma/helper/constants.dart';
import 'package:kurkoruma/pages/home_page.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:kurkoruma/state/theme_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyCAYZ8ljW8ALBJbIKRFxzyqdk4XBrlfMtA",
      appId: "1:264860151536:web:5fff53000770771e2ddc35",
      messagingSenderId: "264860151536",
      projectId: "kurkoruma",
    ),
  );
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Calculator()),
        ChangeNotifierProvider(create: (_) => ThemeManager()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kur Korumalı TL Mevduatı ',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<ThemeManager>().themeMode,
        home: const HomePage());
  }
}
