import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/view/pages/init_page.dart';
import 'package:bright_impact/view/pages/main_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => AppState(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    const secondaryColor = Color(0xFF1A2A39);
    const primaryColor = Color(0xFF38C776);

    return MaterialApp(
      title: 'Bright Impact',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1A2A39),
        primaryColor: primaryColor,
        secondaryHeaderColor: secondaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headlineSmall: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            labelLarge: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            labelMedium: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
            titleMedium: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 80, 80, 80),
            )),
            
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor:
              Color.fromARGB(121, 56, 199, 118), // Farbe der Markierung
          cursorColor: primaryColor, // Farbe des Cursors
          selectionHandleColor: primaryColor,
        ),
      ),
      home: appState.isLoggedIn ? MainNavigationPage() : InitPage(),
    );
  }
}
