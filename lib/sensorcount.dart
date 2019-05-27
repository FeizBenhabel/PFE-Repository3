import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_agriculture_app/Menu.dart';
import 'package:flutter_agriculture_app/SensorMap.dart';
class SensorCount extends StatefulWidget {
  @override
  _SensorCountState createState() => _SensorCountState();
}

class _SensorCountState extends State<SensorCount> with TickerProviderStateMixin  {
  String sennumber="aa";
  bool visible=false;
  int sensorsdowncount;
  double opacity=1.0;
  AnimationController animationController;
  Animation animation;
  _SensorCountState() {
    if(sensorsdowncount!=0){
      animationfunc();
    }
  }
  void animationfunc(){
    animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    animation=ColorTween(
        begin:Colors.redAccent,
        end: Colors.green,
    ).animate(animationController)..addListener((){
      setState(() {
        if(animationController.isCompleted){
          animationController.reverse();
          animationfunc();
        }
      });
    });
    animationController.forward();
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
                  color:Colors.green,

                elevation: 2.1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0),
                ),
                child: new InkWell(
                    onTap: () {
                           setState(() {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => Menu(SensorMap())),);
                           });
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
                                child:Icon(FontAwesomeIcons.heartbeat,color: Colors.white,size: 25.0,)
                              ),
                              SizedBox(
                                height: 10.0,
                                width: 10.0,
                              ),
                              Center(
                                child: Text(sennumber,style: TextStyle(fontSize:30.0,fontWeight:FontWeight.bold,color: Colors.white),),
                              ),
                              SizedBox(
                                height: 5.0,
                                width: 5.0,
                              ),
                                Center(
                                    child:Visibility(
                                      visible:visible,
                                        child: Stack(
                                        children: <Widget>[
                                          Container(
                                              child:Padding(
                                              padding: EdgeInsets.only(left:0),
                                              child:Text(sensorsdowncount.toString(),style: TextStyle(fontSize:30.0,color:animation.value,fontWeight: FontWeight.bold,),),
                                              ),
                                              ),
                                          Padding(
                                            padding: EdgeInsets.only(left:20,top:2.0),
                                          child:Icon(Icons.signal_wifi_off,size: 28.0,color: animation.value,)
                                          ),

                                            ],
                                      ),
                                      ),
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
