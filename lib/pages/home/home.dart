import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/fetchdata.dart';
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
  String city = "Lahore";
  late Future model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello", style: theme.headingText()),
          HomeWidgets().contWidget(),
          FutureBuilder(
              future: FetchData().getdata(city),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Text(snapshot.data["location"]["name"]),
                  );
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
