import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'loginpage.dart';
class Homepage extends StatefulWidget {
  @override
  Hompagepage_State  createState() =>  Hompagepage_State();
}

class  Hompagepage_State extends State<Homepage> with SingleTickerProviderStateMixin {
 Animation animation;
 AnimationController _controller;
 @override
 @override
void dispose(){
   Navigator.of(context).pushNamed("LoginPage");
   _controller.dispose();
 }
 @override
  Widget build(BuildContext context) {
    return new  Center(
      child:Container(
      color: Colors.red,
      width: animation.value,
      height: animation.value,
      )
    );

  }

}
