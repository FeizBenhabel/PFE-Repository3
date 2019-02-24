import 'package:flutter/material.dart';
import 'authentication.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'noInternet.dart';
class LoginPage extends StatefulWidget {

Authentication auth=new Authentication();
  VoidCallback login;
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Text mytext;
  bool iconisvisible = false;
  Icon visibilityIcon = Icon(Icons.visibility);
  bool ishidedPassword = true;
  bool isvisibleLogo = true;
  bool passwordTyped = false;
  bool isDisabledButton=true;
  var password_controller = TextEditingController();
  var email_controller = TextEditingController();
  var passwordFocusNode = new FocusNode();
  bool isConnected=false;

  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  void showHidePassword() {
    setState(() {
      if (ishidedPassword == true && passwordTyped == true) {
        ishidedPassword = false;
        visibilityIcon = Icon(Icons.visibility_off);
      } else {
        ishidedPassword = true;
        visibilityIcon = Icon(Icons.visibility);
      }
    });
  }
  void disableButton(){
    setState(() {
      if(isEmail(email_controller.text)==true&&password_controller.text!=""){
        isDisabledButton=false;
      }
      else
      {
        isDisabledButton=true;

      }
    }

    );
  }
  Color loginTextColor(){
    if(isDisabledButton)
      return Colors.grey;
    else
      return Colors.white;
  }
/***********Connexion**********************/
   Future <void> _SignIn()async{
    print("$isConnected");
    if(isConnected==true)
     try {
     String userid = await widget.auth.login(email_controller.text, password_controller.text);
     widget.login();
     }catch(e){

     }
     else {
          showDialog(context:context,child:NoInternet());
    }
    }
/*****************************************/

  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 75.0,
        child: Image.asset('img/logo-agri.png'),
      ),
    );
    final email = TextField(
      autofocus: false,
      textInputAction: TextInputAction.next,
      controller: email_controller,
      onEditingComplete: () {
        setState(() {
          //   visible = true;
          disableButton();
        });
      },
      onTap: () {
        setState(() {
          isvisibleLogo = false;
          disableButton();
        });
      },
      onChanged: (text){
        setState(() {
          disableButton();
        });
      },
      onSubmitted: (text) {
        setState(() {
          disableButton();
          FocusScope.of(context).requestFocus(passwordFocusNode);
        });
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Adresse e-mail",
        icon: Icon(Icons.email),
      ),
    );
    /*************Password TextField*************/

    TextField password = TextField(
      autofocus: false,
      obscureText: ishidedPassword,
      autocorrect: false,
      focusNode: passwordFocusNode,
      controller: password_controller,
      onTap: () {
        setState(() {
          isvisibleLogo = false;
          disableButton();

        });
      },
      onChanged: (text) {
        setState(() {
          disableButton();
          passwordTyped = true;
          iconisvisible = true;
          if (password_controller.text == "") {
            iconisvisible = false;
            passwordTyped = false;
            ishidedPassword = true;
            visibilityIcon = Icon(Icons.visibility);
          }
        });
      },
      onSubmitted: (text) {
        setState(() {
          disableButton();
          isvisibleLogo = true;
          if (password_controller.text == "") {
            visibilityIcon = Icon(Icons.visibility);
            iconisvisible = false;
          }
        });
      },

      decoration: InputDecoration(
        icon: Icon(Icons.lock_outline),
        hintText: "Mot de passe ",
      ),
    );
    /****************Login Button***********/
    var loginbutton = FloatingActionButton.extended(
      onPressed: isDisabledButton ? null :_SignIn,
      tooltip: 'CONNEXION',
      icon: Icon(
        Icons.account_circle,
      ),

      label: Text(
        "CONNEXION",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: loginTextColor(),
        ),
        textDirection: TextDirection.ltr,
      ),
      backgroundColor: Colors.green.shade300,

    );
/*******************************************************/

    /***************Stack **************************************/
    var showhide = IconButton(
      // icon: Icons.visibility,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,

      icon: Icon(Icons.visibility),
      //iconSize: 20.0,
      onPressed: () {
        setState(() {
          showHidePassword();
        });
      },
    );

    var forgetPasswordButton = FlatButton.icon(
      icon: Icon(Icons.help_outline, size: 15.0, color: Colors.grey),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {

      },
      label: Text(
        "Mot de passe oublié?",
        style: new TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
            decoration: TextDecoration.underline),
      ),
    );

    var stack = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 20.0),
          child: password,
        ),
        Container(
          // padding:EdgeInsets.only(right:0.0,),

            child: Positioned(
              right: 20.0,
              child: Visibility(
                  visible: iconisvisible,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: visibilityIcon,
                    onPressed: showHidePassword,
                  )),
            ))
      ],
    );

    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (BuildContext context, _connectivityResult) {
                if(_connectivityResult.data==ConnectivityResult.none){
                  isConnected=false;
                }else
                  isConnected=true;

          return new Scaffold(
            // backgroundColor: Colors.lightGreen.shade50,
            body: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Visibility(
                  visible: isvisibleLogo,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 10.0),
                    child: Center(
                      child: logo,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60, right: 20.0),
                  child: email,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, right: 0.0),
                  child: stack,
                ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: forgetPasswordButton,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0),
                  child: loginbutton,
                ),
              ],
            ),
          );

        }
    );

  }
}