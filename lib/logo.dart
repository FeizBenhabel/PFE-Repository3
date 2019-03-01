import 'package:flutter/material.dart';
class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
  double raduis;
  void setRaduis(double raduis){
    this.raduis=raduis;
  }
}

class _LogoState extends State<Logo> {

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: widget.raduis,
        child: Image.asset('img/logo-agri.png'),
      ),
    );
  }
}
