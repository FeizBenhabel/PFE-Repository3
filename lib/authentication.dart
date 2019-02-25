import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Authentication  {


  Future<String> login(String email,String password) async{

     FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password:password);

     return user.uid;

  }

Future<void>logout() async{
    FirebaseAuth.instance.signOut();
}

Future<void>resetpassword(String email)async{

       await FirebaseAuth.instance.sendPasswordResetEmail(email: email,);


    }


  }


