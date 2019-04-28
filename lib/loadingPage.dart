import 'package:flutter/material.dart';
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding:EdgeInsets.only(left: 10.0,right: 10.0),
        child:CircularProgressIndicator(
                  value: 0.9,
                  backgroundColor: Colors.lightGreen,


        ),
      ),
        ),
    );
  }
}
