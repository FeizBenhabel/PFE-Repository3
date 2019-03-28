import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'logo.dart';
import 'MenuShape.dart';
class Homepage extends StatefulWidget {
  @override
  Hompagepage_State  createState() =>  Hompagepage_State();
}
class  Hompagepage_State extends State<Homepage>  {
Authentication auth =new Authentication();
VoidCallback logout;
String email;
void click(){
  setState(() {
    auth.logout();
  });
}
getData() async {
 // return await Firestore.instance.collection('testcrud').getDocuments();
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.getUser().then((user){
      setState(() {
        email=user.email;
      });
    });
  }
 @override
  Widget build(BuildContext context) {
  Logo logo=new Logo();
  logo.setRaduis(10.0);
 return Scaffold(
   appBar: new AppBar(
     title: Text(email.toString()),
   ),

     drawer: new ClipPath(
           clipper:MenuShape(),
           child:Container(
           color: Colors.white,
           child:
            new ListView(
             children: <Widget> [
               new DrawerHeader(child:
               logo,),
               new ListTile(
                 title: new Text('Papge1'),
                 onTap: () {},
               ),
               new ListTile(
                 title: new Text('Papge2'),
                 onTap: () {},
               ),
               new ListTile(
                 title: new Text('Papge3'),
                 onTap: () {},
               ),
               new ListTile(
                 title: new Text('Papge4'),
                 onTap: () {},
               ),
               new ListTile(
                 title: new Text('Papge5'),
                 onTap: () {},
               ),
               new ListTile(
                 title: new Text('Papge6'),
                 onTap: () {},
               ),
               new ListTile(
                 title: new Text('Papge7'),
                 onTap: () {},
               ),
               new Divider(),
               new ListTile(
                 title: new Text('Logout'),
                 trailing: Icon(Icons.done),
                 onTap: () {
                   setState(() {
                     Authentication auth=new Authentication();
                     auth.logout();
                   });
                 },
               ),

               new ListTile(
                 title: new Text('Contact us'),
                 trailing: Icon(Icons.contacts),
                 onTap: () {},
               ),
             ],
           ),
           ),
         ),

   body:StreamBuilder(
         stream:Firestore.instance.collection("Users").snapshots(),
         builder: (BuildContext context, snapshot) {
           if (snapshot.hasData) {
             return Text(snapshot.data.documents[0]["email"].toString());
           }
         }

     ),
  bottomNavigationBar: BottomNavigationBar(items:[
      new BottomNavigationBarItem(icon:Icon( Icons.account_box),
     title: Text('Profile'),
   ),
      new BottomNavigationBarItem(
        icon: Icon(Icons.mail),
        title: Text('Messages'),
      ),

 ],
 ),
 );
  }

}
