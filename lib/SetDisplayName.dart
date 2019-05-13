import 'package:flutter/material.dart';
class SetDisplayName extends StatefulWidget {
  @override
  _SetDisplayNameState createState() => _SetDisplayNameState();
}

class _SetDisplayNameState extends State<SetDisplayName> {
   @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          new Center(
            child:Text("Please Type your Display Name"),
          ),
          SizedBox(
            height: 10.0,
          ),
              TextField(
                autocorrect: false,
                autofocus: true,
              ),
            SizedBox(
              height: 20.0,
            ),
           FlatButton.icon(
             onPressed: null,
              icon: Icon(Icons.done),
             label:new Text("Done!") ,
             
           )



        ],

      ),


    );
  }
}
