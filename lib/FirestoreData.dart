import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class FirestoreData {

Future<QuerySnapshot>sensorsData(){
   Firestore.instance.collection("Mesures").orderBy('created_At',).limit(10);
}


}