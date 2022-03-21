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
  String city = "Faisalabad";
  late Future<dynamic> fetched;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetched = FetchData().getdata(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: fetched,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).viewPadding.top),
                    child: Text(snapshot.data["location"]["name"]),
                  );
                }
                return const CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
