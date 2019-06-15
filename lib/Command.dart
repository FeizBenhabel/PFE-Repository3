import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
class Command extends StatefulWidget {
int connectivity;
  Command(int connect){
      connectivity=connect;
  }
  @override
  _CommandState createState() => _CommandState();
}

class _CommandState extends State<Command> {
  @override
  int  status;

  Future<bool> internetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
    builder: (BuildContext context, connectivitysnapshot) {
    return FutureBuilder(
        future: internetConnectivity(),
        builder: (BuildContext context, internetsnapshot) {
          if(internetsnapshot.data==true) {
            return StreamBuilder(
                stream: Firestore.instance.collection("Users").document(
                    "7iJJ5VpV9A2gtUOgcEub")
                    .collection("Electrovanne")
                    .snapshots(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData)
                    status = snapshot.data.documents[0].data['status'];
                  String text, cmd;
                  if (status == 0) {
                    text = "OFF";
                    cmd = "ON";
                  }
                  else {
                    text = "ON";
                    cmd = "OFF";
                  }
                  print(widget.connectivity);
                  return Scaffold(

                    body: Center(
                      child: ListView(
                        children: <Widget>[
                          SizedBox(
                            height: 80.0,
                          ),
                          Text("Electrovanne Status is :" + text,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0,),
                            textAlign: TextAlign.center,),
                          SizedBox(
                            height: 120.0,
                          ),
                          ListTile(

                            title: Text("Turn it " + cmd),
                            trailing: CupertinoSwitch(
                              value: cmd == "ON" ? false : true,
                              activeColor: Colors.green,
                              onChanged: (bool value) {
                                setState(() {
                                  changeStatus(status == 1 ? 0 : 1);
                                  print("heyy");
                                });
                              },

                            ),
                          ),
                        ],


                      ),


                    ),

                  );
                }
            );
          }else{
            return Center(
              child: Text("No Internet Connection!",
                style: new TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0,),
          textAlign: TextAlign.center,),
            );
          }
        }
          );
    }
    );
  }


Future<void> changeStatus(int status) async{
  Firestore
      .instance.collection("Users").document(
      "7iJJ5VpV9A2gtUOgcEub").collection("Electrovanne").document("electrovanne")
      .updateData({'status':status})
      .catchError((e) {
        print("error");
  });
      }
}
