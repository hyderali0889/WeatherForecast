import 'package:flutter/material.dart';
import '../pages/home/home.dart';
import '../pages/Details/det.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Widget> _childe = [const Home(), const Det()];
  var select = 0;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
       controller: pageController,
       onPageChanged: onpagechan,
        children: _childe,
        
      ),
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
    pageController.jumpToPage(index);
  }

  void onpagechan(int index){
setState(() {
      select = index;
    });
  }
}
