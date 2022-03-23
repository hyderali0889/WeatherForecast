import 'package:flutter/material.dart';
import '../../utils/fetchdata.dart';
import 'homestyles.dart';
import 'widgets/FutureCont.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  var theme = HomeStyles();

  String city = "Faisalabad";
  late Future<dynamic> fetched;

  @override
  void initState() {
    super.initState();
    fetched = getCityData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/home.jpg"),
                opacity: 0.5)),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search_outlined,
                          color: Colors.white),
                      hintText: "Enter City Name",
                      hintStyle: const TextStyle(color: Colors.white54),
                      contentPadding: const EdgeInsets.all(14.0),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.0))),
                  onSubmitted: (value) {
                    setState(() {
                      city = value;
                      fetched = getCityData();
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: fetched,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return futureCont(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> getCityData() {
    return FetchData().getdata(context, city);
  }

  @override
  bool get wantKeepAlive => true;
}
