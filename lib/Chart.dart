import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatefulWidget {
  const Chart();
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  List<double> result = <double>[];
  int length=0;

Widget sparkline(){
  setState(() {

  });
}

  Widget build(BuildContext context) {
    return StreamBuilder(
    stream:Firestore.instance.collection("Mesures").orderBy('created_At',).limit(10).snapshots(),
    builder: (BuildContext context, snapshot) {
      if(!snapshot.hasData){
        return Container(
        );
      }else {
        if(length!=snapshot.data.documents.length){
         int indice=length;
         while(indice<snapshot.data.documents.length) {
           result.add(double.parse(snapshot.data.documents[indice].data['valeur'].toString()));
           print(result.elementAt(indice));
           indice++;
        }
          length=snapshot.data.documents.length;
        }
        return new Card(
          color: Colors.green,
          elevation: 2.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text("Humidité Stats",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child:new Sparkline(
                data: result,
                lineColor: Colors.lightGreen[500],
                fillMode: FillMode.none,
                fillColor: Colors.lightGreen[200],
                pointsMode: PointsMode.all,
                pointSize: 8.0,
                pointColor: Colors.amber,
              ),
              ),
            ],
          ),
        );
      }
    }
    );
  }
}

