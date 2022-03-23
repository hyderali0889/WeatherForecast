import 'package:flutter/material.dart';
import '../../utils/fetchdata.dart';
import './widgets/detContent.dart';

class Det extends StatefulWidget {
  const Det({Key? key}) : super(key: key);

  @override
  State<Det> createState() => _DetState();
}

class _DetState extends State<Det> {
  late Future<dynamic> fetched;
  String city = "Faisalabad";

  Future<dynamic> getCityData() {
    return FetchData().getdata(context, city);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetched = getCityData();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/details.jpg"),
                fit: BoxFit.cover)),
        child: FutureBuilder(
            future: fetched,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                

                return const DetContent();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
