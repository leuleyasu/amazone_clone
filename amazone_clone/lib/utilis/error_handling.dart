import 'dart:convert';

import 'package:amazone_clone/utilis/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void errorHandling({required BuildContext context, required http.Response response, required VoidCallback onSucces}){
  switch (response.statusCode) {
    case 400:
    return showSnackbarCustom(context, jsonDecode(response.body)['msg']);
    case 500:
    return showSnackbarCustom(context, jsonDecode(response.body)['error']);
    default:
    return onSucces();

  }

}