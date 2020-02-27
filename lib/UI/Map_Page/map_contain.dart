import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_detecting_app/Util/custom_colors.dart';
import 'package:geolocator/geolocator.dart';

class MapContainer extends StatefulWidget {
  @override
  _mapContainPageState createState() => _mapContainPageState();
}

class _mapContainPageState extends State<MapContainer> {
  bool mapToggle = false;

  var currentLocation;

  var clients = [];

  GoogleMapController mapController;

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
        populateClients();
      });
    });
  }

  populateClients() {
    clients = [];
    Firestore.instance.collection('markers').getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; ++i) {
          clients.add(docs.documents[i].data);
          initMarker(docs.documents[i].data);
        }
      }
    });
  }

  initMarker(clients){
    mapController.clearMarkers().then((val) {
      mapController.addMarker(
        MarkerOptions(
          position: LatLng(clients['location'].latitude , clients['location'].longitude),
          draggable: false,
          infoWindowText: InfoWindowText(clients['name'],""),
        )
      );
    });
  }

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
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: mapToggle
                  ? GoogleMap(
//                      compassEnabled: true,
                      onMapCreated: onMapCreated,
//                      initialCameraPosition: CameraPosition(
//                          target: LatLng(currentLocation.latitude, currentLocation.longitude), zoom: 7.0),

                    )
                  : Center(
                      child: Text(
                        "Loading..Please wait...",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
        ],
      ),
    );
  }

  void onMapCreated(Controller) {
    setState(() {
      mapController = Controller;
    });
  }
}
