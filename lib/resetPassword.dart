import 'package:flutter/material.dart';
import 'logo.dart';
import 'authentication.dart';
import 'alerDialog.dart';
class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final email_controller = TextEditingController();
  Authentication auth =new Authentication();
  @override
  Widget build(BuildContext context) {
    final email = TextField(
      autofocus: false,
      controller: email_controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Adresse e-mail",
        icon: Icon(Icons.email),
      ),
    );

    var resetbutton = FloatingActionButton.extended(
      onPressed:(){
        setState(() {
                    auth.resetpassword(email_controller.text);
                    AlertMessage alert=new AlertMessage();
                    alert.setMessage("Mot de passe réinitialisé avec succé");
                    alert.setTitle("Réinitialisation du mot de passe");
                    alert.setAction("LoginPage");
                    showDialog(context:this.context,child: alert);

        });
      },
      tooltip: 'Réinitialiser le mot de passe',
      icon: Icon(
        Icons.account_circle,
      ),

      label: Text(
        "Réinitialiser le mot de passe",
        style: new TextStyle(
          fontWeight: FontWeight.bold,

        ),
        textDirection: TextDirection.ltr,
      ),
      backgroundColor: Colors.green.shade300,
    );
    return Scaffold(
      body: Center(
            child: ListView(
              children: <Widget>[
                Logo(),
                SizedBox(height: 20.0,width: 20.0,),
                 Container(
                   padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                 child:email,
                 ),
                SizedBox(height: 70.0,width: 70.0,),
                Container(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                  child: resetbutton,
                ),




              ],


            ),


      ),

    );
  }
}
