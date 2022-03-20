import 'package:flutter/material.dart';
import 'homestyles.dart';
import 'homewidgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var theme = HomeStyles();
  var widgets = HomeWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello", style: theme.headingText()),
          HomeWidgets().contWidget()
        ],
      ),
    );
  }
}
