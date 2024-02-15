import 'package:flutter/material.dart';

void showSnackbarCustom(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}