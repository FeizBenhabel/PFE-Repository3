// This sample shows how to use [onDeleted] to remove an entry when the
// delete button is tapped.

import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'Dashboard.dart';
import 'rootpage.dart';
import 'resetPassword.dart';
import 'Profile.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'RobotoMono',
      ),
        routes : <String, WidgetBuilder>{
          "LoginPage": (context) => LoginPage(),
          "Dashboard": (context) => Dashboard(),
          "RootPage":(context)=>RootPage(),
          "ResetPassword":(context)=>ResetPassword(),
          "Profile":(context)=>Profile(),

        },
      home: RootPage(),
    );
  }
}
