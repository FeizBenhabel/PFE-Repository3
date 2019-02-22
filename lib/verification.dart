import 'package:flutter/material.dart';
class Verfication {


  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  Color loginTextColor(isDisabledButton){
    if(isDisabledButton)
      return Colors.grey;
    else
      return Colors.white;
  }
/*
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

    );*/
/*
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
*/


}