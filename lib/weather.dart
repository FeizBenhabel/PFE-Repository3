import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage();
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String temp;
  double fontsize;
  String imageUrl = "";
  bool connectivity = true;
  Map weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Map> gettingWeatherData() async {
    try {
      String myUrl =
          "http://api.apixu.com/v1/current.json?key=9147f4adf5204f16bc793416191604&q=sfax";
      http.Response response = await http.get(myUrl);
      return json.decode(response.body);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (BuildContext context, connectivitysnapshot) {
          return StreamBuilder(
              stream: gettingWeatherData().asStream(),
              builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                if (snapshot.data == null) {
                  temp = " ";
                  fontsize = 12.0;
                  connectivity = false;
                } else {
                  print("connexion !!!!!!!");
                  temp = snapshot.data['current']['temp_c'].toString() + "°";
                  fontsize = 30.0;
                  imageUrl = "http:" +
                      snapshot.data['current']['condition']['icon'].toString();
                  connectivity = true;
                }
                print(imageUrl);
                return new Card(
                  color: Colors.green,
                  elevation: 2.1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: !connectivity ? 35 : 0,
                      ),
                      new Center(
                        child: !connectivity
                            ? Icon(
                                Icons.cloud_off,
                                size: 38.0,
                                color: Colors.white,
                              )
                            : Image.network(imageUrl),
                      ),
                      Center(
                        child: Text(
                          temp,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fontsize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
