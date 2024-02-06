// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazone_clone/constanant.dart';
import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  final VoidCallback onTap;
 final String text;
 const  CutomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, 

    style: ElevatedButton.styleFrom( 
      shape: const LinearBorder(),
      minimumSize: const Size(double.infinity,50) ,backgroundColor: GlobalVariables.secondaryColor) ,
  child: Text(text,style: const TextStyle(color: Colors.white
  ),), 
    );
  }
}
