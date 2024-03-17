import 'package:flutter/material.dart';
import 'package:tec_tac_toe_game/views/pages/home_page.dart';
import 'package:tec_tac_toe_game/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TecTacToe Game',
      theme: AppTheme.mainTheme,
      home: const HomePage(),
    );
  }
}
