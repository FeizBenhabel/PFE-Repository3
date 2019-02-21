import 'package:flutter/material.dart';
import 'authentication.dart';
import 'homepage.dart';
import 'loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatefulWidget {
  Authentication auth=new Authentication();
  bool signedIn=false;
  Future<Map> readingValues;
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {



@override
  void initState() {

    // TODO: implement initState
    super.initState();
   // FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser){
      setState(() {
        if(firebaseUser!=null){
          widget.signedIn=true;
        }else
          widget.signedIn=false;
        // do whatever you want based on the firebaseUser state
      });

    });

    }
    void logout(){
  setState(() {
    widget.signedIn=false;
  });
    }
  void logedIn(){
    setState(() {
    widget.signedIn=true;

  });
  }

  @override
  Widget build(BuildContext context) {
  switch(widget.signedIn){
    case false: return new LoginPage(auth:widget.auth,login: logedIn,);
    break;
    case true:return new Homepage();
  }


  }
  /*
     return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            // logged in using email and password
              //print()

           // (FirebaseAuth.instance.signOut());
              return new  Homepage();
                        }
          else {
            return new LoginPage();
          }
        },
      );
    }*/
      }



