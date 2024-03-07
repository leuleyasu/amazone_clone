import 'dart:convert';

import 'package:amazone_clone/constanant.dart';
import 'package:amazone_clone/feature/presentation/home_screen.dart';
import 'package:amazone_clone/models/user.dart';
import 'package:amazone_clone/provider/login_provider.dart';
import 'package:amazone_clone/utilis/error_handling.dart';
import 'package:amazone_clone/utilis/save_token.dart';
import 'package:amazone_clone/utilis/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthServiceRepositories {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      final User user = User(
          id: "",
          name: name,
          password: password,
          email: email,
          address: "",
          type: "",
          token: "");

      http.Response response = await http.post(
        Uri.parse("$uri/api/signup"),
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      errorHandling(
        context: context,
        response: response,
        onSucces: () => showSnackbarCustom(
            context, "user with the same credential can login"),
      );
    } catch (e) {
      showSnackbarCustom(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json'},
      );

      // ignore: use_build_context_synchronously
      errorHandling(
        context: context,
        response: response,
        onSucces: () async {
          setToken(jsonDecode(response.body)['token']);
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackbarCustom(context, e.toString());
    }
  }

  void getUseData(BuildContext context) async {
    String? token = await getToken();
    if (token == null) {
      setToken('');
    }

    http.Response tokenres = await http.post(
      Uri.parse("$uri/api/verified"),
      headers: {'Content-Type': 'application/json', "x-auth-token": token!},
    );
    if (tokenres == true) {
      http.Response userResponse = await http.get(Uri.parse("$uri/"),
          headers: {'Content-Type': 'application/json', "x-auth-token": token});

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userResponse.body);
    }
  }
}
