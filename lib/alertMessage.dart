import 'package:flutter/material.dart';
class AlertMessage extends StatelessWidget {
  VoidCallback retry;
  String title="La connexion a échoué!";
  String message="Impossible de vous connecter.\nVeuillez vérifier votre connexion Internet.";
  String page="";

 void setAction(String page){
   this.page=page;
 }

  void setTitle(String title){
    this.title=title;
  }

  void setMessage(String message){
    this.message=message;
  }


  @override
  Widget build(BuildContext context) {


    final icon = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 40.0,
        child: Image.asset('img/nointernet.png'),
      ),
    );
    return new AlertDialog(
            title:Text(title),
            content:
                    new Text(message),
            actions: <Widget>[
                    FlatButton(
                        onPressed:() {
                          if(page=="")
                              Navigator.of(context).pop();
                          else
                              Navigator.pushNamed(context,page);
                          },
            child: new Text("Ok"),

        )


      ],

    );
  }
}
