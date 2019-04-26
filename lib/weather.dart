import 'package:flutter/material.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
class WeatherPage extends StatefulWidget {
    WeatherPage( );
  @override
  _WeatherPageState createState() => _WeatherPageState();
}
class _WeatherPageState extends State<WeatherPage>{
  String temp;
  double fontsize;
  String imageUrl="http://";
  bool connectivity=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<Map> gettingWeatherData()async {
    try {
      String myUrl = "http://api.apixu.com/v1/current.json?key=9147f4adf5204f16bc793416191604&q=sfax";
      http.Response response = await http.get(myUrl);
      return json.decode(response.body);
    }catch(e){
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:gettingWeatherData(),
        builder: (BuildContext context, snapshot) {
           imageUrl="http:";
          if(snapshot.data==null){
              temp="no internet connexion!";
              fontsize=12.0;
              connectivity=false;
          }
          else{
              temp=snapshot.data['current']['temp_c'].toString()+"°";
              fontsize=30.0;
              imageUrl=imageUrl+snapshot.data['current']['condition']['icon'].toString();
              connectivity=true;
          }
          return new Card(
            color:Colors.green,
            elevation:2.1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            child: ListView(
              children: <Widget>[
                new Center(
                  child: Image.network(imageUrl),
                ),
                Center(
                  child: Text(temp,style: TextStyle(color: Colors.white,fontSize: fontsize,fontWeight:FontWeight.bold),),
                ),
              ],
            ),
          );
  }
    );
}


}