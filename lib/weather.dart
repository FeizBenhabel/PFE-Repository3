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
    getweath();
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
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Center(
          child:Text("Méteo",style:TextStyle(fontSize: 20.0,color:Colors.blue.shade300),),
          ),
          SizedBox(
            height: 10.0,
          ),
          new Center(
            child: Icon(FontAwesomeIcons.cloudSun,color: Colors.yellow,size: 40.0,),
          ),
          new Stack(
            //padding: EdgeInsets.only(right: 130.0,top: 10),
           children: <Widget>[
             Padding(
               padding: EdgeInsets.only(left: 40.0,top: 17),
               child:Icon(FontAwesomeIcons.temperatureLow,size: 17.0,color: Colors.blueGrey,),
             ),
              Padding(
               padding: EdgeInsets.only(left: 15.0,top: 15.0),
               child: Text("30",style: TextStyle(color: Colors.blueGrey,fontSize: 19.0,fontWeight:FontWeight.bold),),
             ),
             Padding(
               padding: EdgeInsets.only(left: 130.0,top:13.5),
               child: Icon(FontAwesomeIcons.wind,color: Colors.blueGrey,)
             ),
             Padding(
               padding: EdgeInsets.only(left: 72.0,top: 17.0),
               child: Text("10km/h",style: TextStyle(color: Colors.blueGrey,fontSize: 16.0,fontWeight:FontWeight.bold),),
             ),
           ],
          ),
        ],
      ),
    );
  }
}
