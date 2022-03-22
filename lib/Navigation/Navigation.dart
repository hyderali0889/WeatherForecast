import 'package:flutter/material.dart';
import '../pages/home/home.dart';
import '../pages/Details/det.dart';


class Navigation extends StatefulWidget {
  const Navigation({ Key? key }) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  List childe = [
    const Home(),
   const Det()
  ];
    var select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childe[select],
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff131313),
        selectedItemColor: Colors.green,
        currentIndex: select,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Details")
        ],
        onTap: _onItemTapped,
      ),
    );

    
  }

   void _onItemTapped(int index) {
    setState(() {
      select = index;
    });
  }
}