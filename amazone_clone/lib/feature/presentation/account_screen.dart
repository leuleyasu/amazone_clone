import 'package:amazone_clone/constanant.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const  BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
                
              
            ),
          ),
        ),

      ),
    );
  }
}