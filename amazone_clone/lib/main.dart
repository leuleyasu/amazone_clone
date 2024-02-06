import 'package:amazone_clone/config/route.dart';
import 'package:amazone_clone/constanant.dart';
import 'package:amazone_clone/feature/presentation/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ))),
        home: const AuthScreen(),
        onGenerateRoute: (settings) => onGenerateRouteSetting(settings),
        );
          
          
  }
}
