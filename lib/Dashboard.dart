import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'logo.dart';
import 'MenuShape.dart';
import 'loginpage.dart';
import 'sensorcount.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'weather.dart';
import 'Chart.dart';
class Dashboard extends StatefulWidget {
  @override
  Hompagepage_State  createState() =>  Hompagepage_State();
}
class  Hompagepage_State extends State<Dashboard>  {
Authentication auth =new Authentication();
VoidCallback logout;
String email,id;
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

      });
    });
  }
List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(6,3),
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2,1.5),
  const StaggeredTile.count(2,1.5),


];

List<Widget> _tiles =  <Widget>[
  const Chart(),
  //_Example01Tile(Colors.white, Icons.wifi),
  const  _Example01Tile(Colors.white, Icons.panorama_wide_angle),
  const SensorCount(Icons.email),
  const WeatherPage(),

];
@override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:Color(0xff534268),
          elevation: 0.0,
      ),
    body:new Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
    //  stops: [0.1, 0.5, 0.7, 0.9],

      colors:[
        Color(0xff534268),
        Color(0xff504165),
        Color(0xff504164),
        Color(0xff504165),
        Color(0xff343A64),
      ],
    ),
  ),
    child:new Container(
      color: Colors.transparent,
    padding: const EdgeInsets.only(top: 12.0),
    child: new StaggeredGridView.count(

    crossAxisCount: 4,
    staggeredTiles: _staggeredTiles,
    children:_tiles,
    mainAxisSpacing: 7.0,
    crossAxisSpacing: 7.0,
    padding: const EdgeInsets.all(4.0),
  )
    ),
    ),
    );

  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Color(0xff595377),
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}