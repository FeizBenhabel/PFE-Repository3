import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/animation.dart';
class SensorCount extends StatefulWidget {
  final IconData iconData;
  const SensorCount(this.iconData);
  @override
  _SensorCountState createState() => _SensorCountState();
}

class _SensorCountState extends State<SensorCount> with SingleTickerProviderStateMixin  {
  String sennumber="";
  bool visible=false;
  int sensorsdowncount;
  double opacity=1.0;
  AnimationController animationController;
  Animation animation;
  Duration duration=Duration(seconds: 1);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
        debugPrint(opacity.toString());
        animationController = AnimationController(
            duration: Duration(milliseconds: 2000), vsync: this);

    });

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
           //   opacity=opacity==0.0?1.0:0.0;
            //  duration=Duration(seconds: 1);
              return new Card(
                  color: Color(0xff595377),
                elevation: 0.1,
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
                                child:Icon(FontAwesomeIcons.cogs,color: Colors.white,size: 25.0,)
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
                                          AnimatedOpacity(
                                            duration: duration,
                                            opacity:opacity,
                                              child:Padding(
                                              padding: EdgeInsets.only(left:0),
                                              child:Text(sensorsdowncount.toString(),style: TextStyle(fontSize:30.0,color:Colors.red,fontWeight: FontWeight.bold,),),
                                              ),
                                              ),
                                          Padding(
                                            padding: EdgeInsets.only(left:20,top:2.0),
                                          child:Icon(Icons.perm_scan_wifi,size: 28.0,color: Colors.red,)
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
