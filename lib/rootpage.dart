import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loadingPage.dart';
import 'Menu.dart';
class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
void loggedIn(){

}
  @override
  Widget build(BuildContext context) {
/*if user  logged in before, load his profile even when he's offline ,Connectivity check are made in Login  and ResetPassword Pages
  checking user state is made using firebase API and the streamBuilder will handle changes for snapshot state.
  */
          return StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (BuildContext context, snapshot) {
             if(snapshot.hasData)
               return new Menu(Dashboard());
             else
               switch(snapshot.connectionState){
                 case ConnectionState.waiting:return LoadingPage();
                 break;
                 default:
                   return new LoginPage();
               }

            }
  );
  }
}


