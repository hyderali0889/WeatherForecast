import 'dart:convert';
import 'package:http/http.dart';

class FetchData {
  Future<dynamic> getdata(String city) async {
    var url =
        "http://api.weatherapi.com/v1/forecast.json?key=4889c63a9205421a83b144841222003&q=$city&days=7&aqi=no&alerts=no";
    Response res = await get(Uri.parse(url));
    if (res.statusCode == 200) {    
      return json.decode(res.body);
    } else {
      return Exception("Error getting weather forecast");
    }
  }
}
