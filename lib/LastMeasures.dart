import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LastMeasures extends StatefulWidget {
  @override
  _LastMeasuresState createState() => _LastMeasuresState();
}
class _LastMeasuresState extends State<LastMeasures> {

int sensercount=0;
int indice=0;
int indice2=0;
String capteur_id="";
@override
      void initState() {
            // TODO: implement initState
           super.initState();
           Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").where('status',isEqualTo:1).getDocuments().then((onValue){
             setState(() {
                    sensercount=onValue.documents.length;
                   // print(sensercount.toString());
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
     
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //stream to get measures!!!
      stream:Firestore.instance.collection("Mesures").orderBy('created_At',descending: true).limit(2).snapshots(),
      builder: (BuildContext context, snapshot) {
        return new Card(
          color: Colors.green,
          elevation: 2.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
          child: ListView.builder(
              itemCount: 2,
              //sensercount == null ? 0 : sensercount,
              itemBuilder: (BuildContext context, int index) {
                print("indexis:" + index.toString());
                capteur_id = snapshot.data.documents[index].data['id_capteur'].toString();
                return StreamBuilder(
                  //stream to get zone_id
                    stream: Firestore.instance.collection("Users").document(
                        "7iJJ5VpV9A2gtUOgcEub").collection("capteurs").where('id_capteur', isEqualTo: capteur_id).snapshots(),
                    builder: (BuildContext context, zonesnapshot) {
                      if (zonesnapshot.hasData)
                        print(zonesnapshot.data.documents[0].data['zone']);
                      return ListTile(
                        title: Text(snapshot.data.documents[0].data['valeur']),      // subtitle: Text(),
                      );
                    }
                );
              }
          ),
        );
      }
          );
      }
    }






