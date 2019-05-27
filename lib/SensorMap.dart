import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Sensor.dart';
class SensorMap extends StatefulWidget {
  @override
  _SensorMapState createState() => _SensorMapState();
}

class _SensorMapState extends State<SensorMap> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
   Set<Marker> markers = {};
  int sensercount = 0;
   List<Sensor>sensors=new List();
  static const LatLng _center = const LatLng(34.766257, 10.455580);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
addMarker();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
addingSensors();

      }

Future  addingSensors()async{
  Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").getDocuments().then((onValue) {
    setState(() {
      sensercount = onValue.documents.length;
      for (int i = 0; i<sensercount; i++) {
        Sensor sensor=new Sensor();
        GeoPoint geoPoint = onValue.documents[i].data['position'];
        double lat = geoPoint.latitude;
        double lng = geoPoint.longitude;
        sensor.lng=lng;
        sensor.lat=lat;
        sensor.status=onValue.documents[i].data['status'];
        sensor.id=onValue.documents[i].data['id_capteur'].toString();
        Firestore.instance.collection("Mesures").where("id_capteur",isEqualTo: sensor.id).getDocuments().then((mesure) {
          setState(() {
            print("valeurrrrrrrrrr!!!!!!!!!!!"+mesure.documents[0].data['valeur']);
            sensor.value= mesure.documents[0].data['valeur'];
          });

        });

        sensors.add(sensor);
      }
    });
    print("completed");
  });
}
Future<String> getvalue (String id_capteur)async{
    print("heeeey");
    setState(() {
      Firestore.instance.collection("Mesures").where("id_capteur",isEqualTo: id_capteur).getDocuments().then((mesure) {
        print("valeurrrrrrrrrr!!!!!!!!!!!"+mesure.documents[0].data['valeur']);
        return mesure.documents[0].data['valeur'];
      });
    });
}


  void addMarker() {
    for(int i=0;i<sensercount;i++) {
        markers.add(Marker(
          markerId: MarkerId(sensors.elementAt(i).id),
          position: LatLng(sensors.elementAt(i).lat,sensors.elementAt(i).lng),
          infoWindow: InfoWindow(
            title: 'capteur_id:' +sensors.elementAt(i).id,
            snippet:
            'valeur:' +sensors.elementAt(i).value.toString(),
          ),
          icon: sensors.elementAt(i).status==1? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen): BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),

        ));
      }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream:Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").snapshots(),
    builder: (BuildContext context, snapshot) {

      return new  GoogleMap(
            myLocationEnabled: false,
            markers: markers,
            mapType: MapType.satellite,
            onMapCreated: _onMapCreated,
            scrollGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 9.0,
            ),
          );
    }
    );
  }
}
