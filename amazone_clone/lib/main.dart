import 'package:amazone_clone/config/route.dart';
import 'package:amazone_clone/constanant.dart';
import 'package:amazone_clone/feature/domian/Repositories/auth_repositories.dart';
import 'package:amazone_clone/feature/presentation/BottomBar.dart';
import 'package:amazone_clone/feature/presentation/auth_screen.dart';
import 'package:amazone_clone/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  AuthServiceRepositories authService =AuthServiceRepositories();
  UserProvider userprovider= UserProvider();
  @override
  void initState() {
    authService.getUseData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )   

      ],
      child: MaterialApp(
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
        home:   userprovider.user.token.isNotEmpty? const  BottomBar(): const AuthScreen()
,        onGenerateRoute: (settings) {
          // print(settings);
          return onGenerateRouteSetting(settings);
        }
      ),
    );
  }
}
