import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'LineChart.dart';
import 'weather.dart';
import 'sensorcount.dart';
import 'piechart.dart';
import 'Chart.dart';
class Dashboard extends StatefulWidget {
  @override
  Hompagepage_State  createState() =>  Hompagepage_State();
}
class  Hompagepage_State extends State<Dashboard> {
  @override
    List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
      const StaggeredTile.count(4,3),
      const StaggeredTile.count(4, 2.3),
      const StaggeredTile.count(2, 1.5),
      const StaggeredTile.count(2, 1.5),
    ];

    List<Widget> _tiles = <Widget>[
      //9CustomMeasureTickCount(null),
      Chart(),
      Piechart(),
      SensorCount(),
      WeatherPage(),
    ];
    @override
    Widget build(BuildContext context) {
     return Container(
         color: Colors.white,
         child: new Container(
         color: Colors.transparent,
         padding: const EdgeInsets.only(top: 12.0),
      child: new StaggeredGridView.count(
      crossAxisCount: 4,
      staggeredTiles: _staggeredTiles,
      children: _tiles,
      mainAxisSpacing: 7.0,
      crossAxisSpacing: 7.0,
      padding: const EdgeInsets.all(4.0),
      )
      ),
      );
    }
  }

