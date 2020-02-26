import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_detecting_app/Util/custom_colors.dart';

class MapContainer extends StatefulWidget {
  @override
  _mapContainPageState createState() => _mapContainPageState();
}

class _mapContainPageState extends State<MapContainer> {
  GoogleMapController _Controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: CustomColors.APP_BAR_COLOR,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height -50.0,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              compassEnabled: true,
              onMapCreated: mapCreated,
              initialCameraPosition: CameraPosition(target: LatLng(7.8731, 80.7718),zoom: 7.0),
             ),
          ),
        ],

      ),
    );
  }

  void mapCreated(Controller){
    setState(() {
      _Controller = Controller;
    });
  }

}
