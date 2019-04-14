import 'package:flutter/material.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:jaguar_resty/jaguar_resty.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage();
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>{
  String weather;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future  getweath()async{
    var globalClient = IOClient();

    final api = OpenWeatherApi("76df7a73cd2bde4da0a3d3a268458f83");
    //print((await api.byId("2172797")).simplified());


    //print((await api.hourlyForecastsById("2172797")).simplified());
    weather=(await api.byName("Sfax").toString());
  }





  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff595377),
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[

          SizedBox(
            height: 10.0,
          ),
          new Center(
            child: Icon(FontAwesomeIcons.cloudSun,color: Colors.white,size: 40.0,),
          ),
          SizedBox(
            height: 15.0,
          ),
              Center(
               child: Text("30°",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight:FontWeight.bold),),
             ),
        ],
      ),
    );
  }
}
