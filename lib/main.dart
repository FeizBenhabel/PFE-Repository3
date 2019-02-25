// This sample shows how to use [onDeleted] to remove an entry when the
// delete button is tapped.

import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'homepage.dart';
import 'rootpage.dart';
import 'resetPassword.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Flutter Code Sample for material.DeletableChipAttributes.onDeleted',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
        routes : <String, WidgetBuilder>{
          "LoginPage": (context) => LoginPage(),
          "Homepage": (context) => Homepage(),
          "RootPage":(context)=>RootPage(),
          "ResetPassword":(context)=>ResetPassword(),
        },
      home: RootPage(),
    );
  }
}
