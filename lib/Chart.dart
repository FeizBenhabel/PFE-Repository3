import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
class Chart extends StatefulWidget {
  const Chart();
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  math.Random random = new math.Random();
  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 100);
    }

    return result;
  }

  Widget build(BuildContext context) {
    return new Card(
     color: Color(0xff595377),
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.0),
      ),
    child: ListView(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Center(
          child:Text("Humidité Stats",style: TextStyle(fontSize:20.0,color: Colors.white),),
        ),
         Padding(
           padding: EdgeInsets.only(top: 60.0,left: 20.0,right: 20.0),

            child: new Sparkline(
              data: _generateRandomData(20),
             lineColor: Colors.lightGreen[500],
             fillMode: FillMode.none,
             fillColor: Colors.lightGreen[200],
             pointsMode: PointsMode.all,
             pointSize: 8.0,
            pointColor: Colors.amber
              ,
    ),
    ),
    ],
    ),
    );
  }
}

