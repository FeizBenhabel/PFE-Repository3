import 'package:flutter/material.dart';
import 'logo.dart';
import 'alertMessage.dart';
import 'verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
import 'logo.dart';
class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool exist=false;
  Logo logo=new Logo();
  final email_controller = TextEditingController();
  var verfication=new Verfication();
  bool isdisabledButton=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logo.setRaduis(75.0);

  }
  @override
  Widget build(BuildContext context) {

    void disablebutton(){
      setState(() {
        isdisabledButton=!verfication.isEmail(email_controller.text);
        print(isdisabledButton);
      });
    }
    final email = TextField(
      autofocus: false,
      controller: email_controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Adresse e-mail",
        icon: Icon(Icons.email),
      ),
      onEditingComplete: () {
        setState(() {
          disablebutton();
        });
      },
      onTap: () {
        setState(() {
          disablebutton();
        });
      },
      onChanged: (text){
        setState(() {
          disablebutton();
        });
      },
      onSubmitted: (text) {
        setState(() {
          disablebutton();
        });
      },
    );
    Future<void>reset() async{
      Authentication auth=new Authentication();
      AlertMessage alert = new AlertMessage();
      try{
        await auth.resetpassword(email_controller.text);
        alert.setMessage("Mot de passe réinitialisé avec succé");
        alert.setTitle("Réinitialisation du mot de passe");
        alert.setAction("LoginPage");
        showDialog(context: this.context, child: alert);
        }catch(err){
        alert.setMessage("Adresse e-mail introuvable!");
        alert.setTitle("Erreur");
        alert.setAction("");
        showDialog(context: this.context, child: alert);

      }

    }
    var resetbutton = FloatingActionButton.extended(
      onPressed:isdisabledButton ? null:reset,
      tooltip: 'Changer',
      icon: Icon(
        Icons.done,
      ),

      label: Text(
        "Changer",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: isdisabledButton ? Colors.grey:Colors.white,
        ),
      ),
      backgroundColor: Colors.green.shade300,
    );

        return Scaffold(
                body: Center(
                  child: ListView(
                    children: <Widget>[
                      logo,
                      SizedBox(height: 20.0, width: 20.0,),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 30.0, top: 10.0),
                        child: email,
                      ),
                      SizedBox(height: 80.0, width: 70.0,),
                      Container(
                        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                        child:resetbutton,
                      ),
                    ],


                  ),


                ),
              );
  }
}
