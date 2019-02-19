import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'loginpage.dart';
class Homepage extends StatefulWidget {
  @override
  Hompagepage_State  createState() =>  Hompagepage_State();
}

class  Hompagepage_State extends State<Homepage>  {

 @override
  Widget build(BuildContext context) {
    return new  Center(
      child:Container(
      child: Text("Welcome !"),
      )
    );

  }

}
