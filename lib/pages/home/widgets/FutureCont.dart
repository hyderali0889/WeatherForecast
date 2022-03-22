import 'package:flutter/material.dart';

import '../homestyles.dart';

Widget futureCont(context, snapshot) {
  var theme = HomeStyles();

  return Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "${snapshot.data["location"]["name"]} , ",
                style: theme.headingText(),
              ),
            ),
            Flexible(
              child: Text(snapshot.data["location"]["country"],
                  style: theme.headingText()),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(14.0)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Today's Temp : ${snapshot.data["current"]["temp_c"]} C / ${snapshot.data["current"]["temp_f"]} F ",
                        style: theme.primaryText()),
                    Text(
                        "Condition : ${snapshot.data["current"]["condition"]["text"]}",
                        style: theme.primaryText()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                    child: Image.network(
                  "http:${snapshot.data["current"]["condition"]["icon"]}",
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Humidity : ${snapshot.data["current"]["humidity"]}",
                        style: theme.primaryText()),
                    Text(
                        "Feels Like : ${snapshot.data["current"]["feelslike_c"]} C / ${snapshot.data["current"]["feelslike_f"]} F ",
                        style: theme.primaryText()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Other Details : ", style: theme.headingText()),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                          "Wind Speed : ${snapshot.data["current"]["wind_mph"]} MPH / ${snapshot.data["current"]["wind_kph"]} KPH ",
                          style: theme.primaryText()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                          "Wind Degree : ${snapshot.data["current"]["wind_degree"]}",
                          style: theme.primaryText()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                          "Wind Direction : ${snapshot.data["current"]["wind_dir"]}",
                          style: theme.primaryText()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                          "Precipation : ${snapshot.data["current"]["precip_mm"]} mm / ${snapshot.data["current"]["precip_in"]} in ",
                          style: theme.primaryText()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                          "Gust Speed : ${snapshot.data["current"]["gust_mph"]} MPH / ${snapshot.data["current"]["gust_kph"]} KPH ",
                          style: theme.primaryText()),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
