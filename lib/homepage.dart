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
 void initState() {
    // TODO: implement initState
    super.initState();
    _controller= AnimationController(duration:Duration(milliseconds: 500),vsync:this);
    animation=Tween(begin: 0.0,end: 500.0).animate(_controller);
    _controller.forward();
  }
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
