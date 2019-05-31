import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'authentication.dart';
import 'alertMessage.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  static String username = "benhabelfeiz@gmail.com";
  static String password = "dvbkbbvdlagqeahq";
  bool progress=false;
  final smtpServer = gmail(username, password);
  final auth=new Authentication();
  TextEditingController message_controller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: Text("Contactez-Nous"),
        ),

        SizedBox(
          height: 15.0,
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
                  setState(() {
                    sending();

                  });
                }, child:progress?new CircularProgressIndicator():Text("Envoyer")),
              )
            ],


    );
  }
  Future sending()async{
    var alert = new AlertMessage();
    try {
      var user = await auth.getUser();
      final message = new Message()
        ..from = new Address(user.email, user.email)
        ..recipients.add('benhabelfeiz@gmail.com')
        ..subject = 'Smart Agriculture App ${new DateTime.now()}'
        ..text = 'This is the plain text.\nThis is line 2 of the text part.'
        ..html = "<h1>Smart Agriculture</h1>\n<p>" +
            message_controller.text.toString() + "</p>";
      final sendReports = await send(message, smtpServer);
      alert.setTitle("Succès");
      alert.setMessage("message envoyé avec succès");
      showDialog(context: this.context, child: alert);
    }catch(e){
      alert.setTitle("échec");
      alert.setMessage("message non envoyé !");
      showDialog(context: this.context, child: alert);
    }

  }
}
