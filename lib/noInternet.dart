import 'package:flutter/material.dart';
class NoInternet extends StatelessWidget {
  VoidCallback retry;
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
      title:Text("La connexion a échoué"),
      content:
          new Text("Impossible de vous connecter.\nVeuillez vérifier votre connexion Internet."),
      actions: <Widget>[
        FlatButton(
            onPressed:() {
                Navigator.of(context).pop();
                      },
            child: new Text("Ok"),

        )


      ],
    );
  }
}
