import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 75.0,
        child: Image.asset('img/logo-agri.png'),
      ),
    );
  }
}
