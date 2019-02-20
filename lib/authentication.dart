import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
class Authentication {

  Future<String> firstLogin (String email,String password) async{
    print("$email");
    print("$password");
     FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password:password);
     return user.uid;

  }

  Future<String> loginInstance() async{
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    return user.uid;

  }


}