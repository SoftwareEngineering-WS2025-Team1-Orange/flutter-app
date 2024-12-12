import 'package:bright_impact/State/AppState.dart';
import 'package:bright_impact/View/Pages/HomePage.dart';
import 'package:bright_impact/View/Pages/InitPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Dio sharedDio = Dio(BaseOptions(
  baseUrl: "https://preview-mainframe.sokutan.de/api/v1",
  connectTimeout:
      Duration(milliseconds: 5000),
  receiveTimeout:
      Duration(milliseconds: 3000),
));

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp()
    )
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);


    return MaterialApp(
      title: 'Bright Impact',
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xFF1A2A39), // Dunkelblauer Hintergrund
        primaryColor: const Color(0xFF38C776),
        secondaryHeaderColor: const Color(0xFF1A2A39), // Grün für Buttons
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 27.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          labelMedium: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: appState.isLoggedIn ? HomePage() : InitPage(),
    );
  }
}

