// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
 final String? lable;
 final TextEditingController controller;
  
  const CustomTextfield({
    Key? key,
    this.lable,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
       Column(
         children: [
              TextFormField(
             decoration:  InputDecoration(
                 labelText: lable,
                 border: const OutlineInputBorder()),
           ),
          
         ],
       )
    );
  }
}
