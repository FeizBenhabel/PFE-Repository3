import 'package:flutter/material.dart';
import 'authentication.dart';
import 'homepage.dart';
import 'loginpage.dart';
class RootPage extends StatefulWidget {
  Authentication auth=new Authentication();
  bool signedIn=false;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
widget.auth.loginInstance().then(( userid){
    setState(() {
     if(userid==null){
           widget.signedIn=false;
      }
     else
        widget.signedIn=false;

});
});
  }
  void logedIn(){
  setState(() {
    widget.signedIn=true;
  });
  }

  @override
  Widget build(BuildContext context) {
      switch(widget.signedIn){
       case  false: return new LoginPage(auth: widget.auth,login:logedIn,);
       case true:return new Homepage();
      }

  }
}
