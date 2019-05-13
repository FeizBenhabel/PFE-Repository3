import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'authentication.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  static String username = "benhabelfeiz@gmail.com";
  static String password = "dvbkbbvdlagqeahq";
  final smtpServer = gmail(username, password);
  final auth=new Authentication();
  TextEditingController message_controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: Text("Contact Us"),
        ),

        SizedBox(
          height: 15.0,
               ),

      Padding(
        padding: EdgeInsets.only(left: 15.0,right: 15.0),
        child:TextField(
          autocorrect:false,
          keyboardType: TextInputType.emailAddress,
          decoration:InputDecoration(
                hintText: "Adresse e-mail",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                   ),
          ),
        ) ,
          SizedBox(
            height: 25.0,
          ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0),
                child:TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                controller: message_controller,
                decoration:InputDecoration(
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0) ),
                  hintText: "Votre Message",
                ),
              ),
            ),
              SizedBox(
               height:10.0,
              ),
              Center(
                child: RaisedButton(onPressed:(){
                  sending();
                }, child: Text("Send")),
              )
            ],


    );
  }
  Future sending()async{
    print(message_controller.text.toString());
    var user=auth.getUser();
    final message = new Message()
      ..from = new Address(username,"test")
      ..recipients.add('benhabelfeiz@gmail.com')
      ..subject = 'Smart Agriculture App ${new DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Smart Agricultuer</h1>\n<p>"+message_controller.text.toString()+"</p>";
     final sendReports = await send(message, smtpServer);
     print("done");


  }
}
