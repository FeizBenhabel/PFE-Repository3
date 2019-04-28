import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Dashboard.dart';
import 'authentication.dart';
import 'Profile.dart';
import 'dart:io';
import 'loadingPage.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}
class _MenuState extends State<Menu> {
  String email=" ",displayName=" ";
  Authentication auth=new Authentication();
  Widget body=Dashboard();
  @override
  void initState() {
    // TODO: implement initState
    // TODO: implement initState
    super.initState();
    auth.getUser().then((user){
      setState(() {
        email=user.email;
        //id=user.uid;
       // displayName=user.displayName;
      });
    });
  }
  Future<bool> connectivity()async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
 return StreamBuilder(
   stream: connectivity().asStream(),
   builder:(BuildContext context, snapshot) {
     print(snapshot.data.toString());
     if (snapshot.connectionState == ConnectionState.waiting) {
       return new LoadingPage();

     }
     else {
       return new Scaffold(
         appBar: AppBar(
         ),
         body: body,
         drawer: Drawer(
           child: ListView(
             padding: new EdgeInsets.all(0.0),
             children: <Widget>[
               UserAccountsDrawerHeader(
                 accountName: Text(displayName),
                 accountEmail: Text(email),
                 currentAccountPicture: CircleAvatar(
                   backgroundColor: Colors.white,
                   child: Text(
                     email.substring(0, 1).toUpperCase(),
                     style: TextStyle(fontSize: 40.0),
                   ),
                 ),
               ),
               ListTile(
                   title: Text("Dashboard"),
                   trailing: Icon(FontAwesomeIcons.chartLine),
                   selected: true,
                   onTap: () {
                     setState(() {
                       Navigator.of(context).pop();
                       body = Dashboard();
                     });
                   }),
               Divider(color: Colors.black, height: 1.6, indent: 12.0,),
               ListTile(
                 title: Text("Profile"),
                 trailing: Icon(FontAwesomeIcons.userCircle),
                 onTap: () {
                   setState(() {
                     Navigator.of(context).pop();
                     body = Profile();
                   });
                 },
               ),
               Divider(color: Colors.black, height: 1.6, indent: 12.0,),
               ListTile(
                 title: Text("Commande"),
                 trailing: Icon(FontAwesomeIcons.bolt),
               ),
               Divider(color: Colors.black, height: 1.6, indent: 12.0,),
               ListTile(
                 title: Text("About us"),
                 trailing: Icon(FontAwesomeIcons.questionCircle),
               ),
               Divider(color: Colors.black, height: 1.6, indent: 12.0,),
               ListTile(
                 title: Text("Contact us"),
                 trailing: Icon(FontAwesomeIcons.envelope),
               ),
               Divider(color: Colors.black, height: 1.6, indent: 12.0,),
             ],

           ),
         ),

         bottomNavigationBar: BottomAppBar(

           color: snapshot.data ? Colors.white : Colors.blueGrey,
           child: snapshot.data ? null : Text(
             "Offline Mode", textAlign: TextAlign.center,),

         ),
       );
     }
   }
 );

  }
}
