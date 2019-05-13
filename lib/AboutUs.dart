import 'package:flutter/material.dart';
class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
      return new ListView(
            children: <Widget>[
              SizedBox(
                height: 19.0,
              ),
              Center(
               child:Text("Smart Agri-App:",textAlign: TextAlign.center,style: new TextStyle(fontWeight:FontWeight.bold),),
              ),
              SizedBox(
                height: 19.0,
              ),
              Text("lo,ezf jf kj lldo d;f  ;f;, fje z,sk fmad msora df ,,ank eaero, jklk"
                  "mlùmlezr mùlmùler :;:!;zar , jgLe aer"
                  "klklerar :k;:,;era  :,;:,zer  zer,;,aerezar MPl aerer ASsrar  ",textAlign: TextAlign.center,textDirection: TextDirection.ltr,),


            ],

    //    Text("rjezkjr"),



    );
  }
}
