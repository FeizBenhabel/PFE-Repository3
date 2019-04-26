import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LastMeasures extends StatefulWidget {
  @override
  _LastMeasuresState createState() => _LastMeasuresState();
}
class _LastMeasuresState extends State<LastMeasures> {

int sensercount=0;
@override
      void initState() {
            // TODO: implement initState
           super.initState();
           Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").where('status',isEqualTo:1).getDocuments().then((onValue){
             setState(() {
                    sensercount=onValue.documents.length;
             });
           });
    }
 String  gettingLastValue(int documentIndice){
     Firestore.instance.collection("Mesures").orderBy('created_At',).getDocuments().then((onValue){
       setState(() {
         return onValue.documents[documentIndice].data['valeur'].toString();
       });
     });
              }
     Widget values(){
      for (int i=0;i<sensercount;i++){
           ListView(
            children: <Widget>[
              Text(gettingLastValue(i)),
            ],
          );
      }
     }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:Firestore.instance.collection("Mesures").orderBy('created_At',).snapshots(),
      builder: (BuildContext context, snapshot) {
      return new Card(
        color:Colors.green,
        elevation: 2.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: ListView(
          children: <Widget>[
            Text(sensercount.toString()),
          //  values(),
          ],
        ),
      );
    }
    );
}

}
