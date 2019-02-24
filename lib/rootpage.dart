import 'package:flutter/material.dart';
import 'homepage.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loadingPage.dart';

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

             if(snapshot.hasData)
               return new Homepage();
             else
               switch(snapshot.connectionState){
                 case ConnectionState.waiting:return LoadingPage();
                 break;
                 default:return new LoginPage();
               }

            }
  );
  }
}


