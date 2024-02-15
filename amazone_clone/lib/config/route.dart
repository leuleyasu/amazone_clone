

import 'package:amazone_clone/feature/presentation/auth_screen.dart';
import 'package:flutter/material.dart';
Route<dynamic> onGenerateRouteSetting(RouteSettings routeSettings){

switch (routeSettings.name) {
  case AuthScreen.authroute:
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (context) => const AuthScreen(),);
    

  default: return  MaterialPageRoute(
    settings: routeSettings,
    builder: (context) => const Text("Screen not found"),);
}

}