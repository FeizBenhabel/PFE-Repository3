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
  static const LatLng _center = const LatLng(34.766893, 10.455580);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
addingSensors();
      }

Future<void>  addingSensors()async{
   QuerySnapshot querySnapshot =await Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").getDocuments();
      sensercount = querySnapshot.documents.length;
      for (int i = 0; i<sensercount; i++) {
        Sensor sensor=new Sensor();
        GeoPoint geoPoint = querySnapshot.documents[i].data['position'];
        double lat = geoPoint.latitude;
        double lng = geoPoint.longitude;
        sensor.lng=lng;
        sensor.lat=lat;
        sensor.status=querySnapshot.documents[i].data['status'];
        sensor.id=querySnapshot.documents[i].data['id_capteur'].toString();
        sensor.value=await getvalue(sensor.id);
        print(sensor.value);
        sensors.add(sensor);
        addMarker(sensor);
      }
}
Future<String> getvalue (String id_capteur)async {
  var querySnapshot = await Firestore.instance.collection("Mesures").orderBy(
      'created_At', descending: true).getDocuments();
  int i = 0;
  while (i < querySnapshot.documents.length) {
    if (querySnapshot.documents[i].data['id_capteur'] == id_capteur) {
      return querySnapshot.documents[0].data['valeur'];
    }
    else
      i++;
  }
}

  void addMarker(Sensor sensor) {
        markers.add(Marker(
          markerId: MarkerId(sensor.id),
          position: LatLng(sensor.lat,sensor.lng),
          infoWindow: InfoWindow(
            title: 'capteur_id:' +sensor.id,
            snippet:
            'valeur:' +sensor.value.toString(),
          ),
          icon: sensor.status==1? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen): BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),

        ));
      }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream:Firestore.instance.collection("Users").document("7iJJ5VpV9A2gtUOgcEub").collection("capteurs").snapshots(),
    builder: (BuildContext context, snapshot) {
        return FutureBuilder(
          future: addingSensors(),
          builder: (BuildContext context, snapshot) {
            return new  GoogleMap(
              myLocationEnabled: false,
              markers: markers,
              mapType: MapType.satellite,
              onMapCreated: _onMapCreated,
              scrollGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 19.0,
              ),
            );
          },
        );

    }
    );
  }
}
