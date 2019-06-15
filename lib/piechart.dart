import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Piechart extends StatefulWidget {
  @override
  _PiechartState createState() => _PiechartState();
}
class _PiechartState extends State<Piechart> {

  Map<String, double> dataMap = new Map();

Future<void>loadingData() async{
  QuerySnapshot querySnapshot=await Firestore.instance.collection("Mesures").orderBy('created_At',).limit(20).getDocuments();
  double field_capacity=0;
  double saturation=0;
  double stress=0;
  for(int i=0;i<querySnapshot.documents.length;i++){
      if(querySnapshot.documents[i].data['valeur']>=55)
          saturation+=1;
      else if(querySnapshot.documents[i].data['valeur']>=32)
        field_capacity+=1;
        else
              stress+=1;
  }
  print(querySnapshot.documents.length);
  dataMap.putIfAbsent("capacité au champs", () => field_capacity);
  dataMap.putIfAbsent("saturation", () => saturation);
  dataMap.putIfAbsent("Point de flétrissement", () => stress);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
Widget chart(){
  return PieChart(
    dataMap: dataMap, //Required parameter
    legendFontColor: Colors.blueGrey[900],
    legendFontSize: 12.5,
    legendFontWeight: FontWeight.w500,
    animationDuration: Duration(milliseconds: 800),
    chartLegendSpacing: 10.0,
    chartRadius: MediaQuery
        .of(context)
        .size
        .width / 2.7,
    showChartValuesInPercentage: true,
    showChartValues: true,
    chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
    showLegends: true,
  );


}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future:loadingData(),
    builder: (BuildContext context, snapshot) {
      Widget child=null;
      switch(snapshot.connectionState){
        case ConnectionState.done:child=chart();
        break;
        default:child=new Center(child:new Text("waiting...."));
        break;
      }
      return   new Card(
          color: Colors.white,
          elevation: 2.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
          child:child
      );

  }
    );
}
}
