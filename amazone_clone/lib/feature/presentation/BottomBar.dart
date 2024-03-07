import 'package:amazone_clone/feature/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedindex=0;
    List <Widget> pages=[
     const  HomeScreen(),
     const Center(
      child: Text("something"),
     ),
       const Center(
      child: Text(" another something"),
     ),

    ];
  @override
  Widget build(BuildContext context) {
  
    void selectpages(int pageindex){
      setState(() {
selectedindex=pageindex;
print(selectedindex);
        
      });
    }
    return Scaffold(
      appBar: AppBar()
      ,
      body: pages[selectedindex]  ,
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: selectedindex,
        onTap: selectpages,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
        label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined)
        ,
        label: ''
        
        ),
        BottomNavigationBarItem(icon:
        badges.Badge(
        badgeContent: Text("2", style: TextStyle(color: 
        Colors.white),),
          child: Icon(Icons.shopping_cart_outlined))
        ,
        label: ''),
     
      ]),
    );

  }
}