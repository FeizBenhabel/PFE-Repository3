import 'package:flutter/material.dart';
import 'homepage.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cnxLost.dart';
import 'package:connectivity/connectivity.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  Widget build(BuildContext context) {

          return StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (BuildContext context, snapshot) {
              return StreamBuilder(
                  stream: Connectivity().onConnectivityChanged,
                  builder: (BuildContext context, connectivity) {
                    if ((snapshot.data!=null) && ((connectivity.data ==ConnectivityResult.none || connectivity.data!=ConnectivityResult.none))){
                      print(snapshot.data);
                      return Homepage();}
                      else
                        if(!snapshot.hasData && connectivity.data!=ConnectivityResult.none){
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text("waiting...");
                          break;
                        default:
                          return new LoginPage();
                      }
                    }
                    else if (connectivity.data==ConnectivityResult.none)
                      return CnxLost();
                  }

              );
            }
  );
  }
}


