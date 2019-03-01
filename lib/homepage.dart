import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
class Homepage extends StatefulWidget {
  @override
  Hompagepage_State  createState() =>  Hompagepage_State();
}

class  Hompagepage_State extends State<Homepage>  {
Authentication auth =new Authentication();
VoidCallback logout;
void click(){
  setState(() {
    auth.logout();
    //logout();
  });
}
 @override
  Widget build(BuildContext context) {
    return new  Center(
      child:Container(
        child:Scaffold(
          body:ListView(
            children: <Widget>[
              Text("Hello:"),
              FlatButton(
                textColor: Colors.red,
                child: Text("click Me"),
                onPressed:click,
              )

            ],
          ),
        )
      //child: Text("Welcome !"),
      )
    );

  }

}
