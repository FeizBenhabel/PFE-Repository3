import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SensorCount extends StatefulWidget {
  final IconData iconData;
  const SensorCount(this.iconData);
  @override
  _SensorCountState createState() => _SensorCountState();
}

class _SensorCountState extends State<SensorCount> {
  String sennumber="";
  bool visible=false;
  int sensorsdowncount;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").snapshots(),
    builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){
            sennumber = snapshot.data.documents.length.toString();

          }
          return new StreamBuilder(
            stream:Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").where('status',isEqualTo:0).snapshots(),
            builder: (BuildContext context, snapshot) {
              if(snapshot.hasData&&snapshot.data.documents.length!=0){
                sensorsdowncount=snapshot.data.documents.length;
                visible=true;
              }else{
                  visible=false;
              }
              return new Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0),
                ),
                child: new InkWell(
                    onTap: () {
                    },
                    highlightColor: Colors.white,
                    child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                          height: 10.0,
                        ),
                        Center(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Center(
                                child:Text("Nombre De Capteurs",style: TextStyle(fontSize:16.0,color: Colors.blue.shade300),),
                              ),
                              SizedBox(
                                height: 10.0,
                                width: 10.0,
                              ),
                              Center(
                                child: Text(sennumber,style: TextStyle(fontSize:30.0,),),
                              ),
                              SizedBox(
                                height: 7.0,
                                width: 7.0,
                              ),
                              Center(
                                child:Visibility(
                                  visible:visible,
                                  child: Text(sensorsdowncount.toString()+" Capteur(s) en panne!",style: TextStyle(fontSize:14.0,color: Colors.redAccent),),
                              )
                              ),
                            ],
                          )

                        ),

                      ],
                    )
                ),
              );

            }

          );

    });

  }



}
