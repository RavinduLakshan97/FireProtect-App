import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_detecting_app/Util/custom_colors.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_detecting_app/UI/Map_Page/map_page_bloc.dart';
import 'package:location_detecting_app/UI/Components/NotificationCard.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Model.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Bloc.dart';

class MapPage extends StatefulWidget {
  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<MapPage> {

  GoogleMapController myController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map",textAlign: TextAlign.start,style: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold)),
        backgroundColor: CustomColors.APP_BAR_COLOR,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 475.0,
            width: double.infinity,
            child: GoogleMap(
              compassEnabled: true,
              onMapCreated: (controller){
                setState(() {
                  myController = controller;
                });
              },
              initialCameraPosition: CameraPosition(target: LatLng(7.8731, -80.7718)),
            ),
          )
        ],
      ),
    );
  }
}
