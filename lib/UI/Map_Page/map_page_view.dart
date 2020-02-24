import 'package:flutter/material.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_detecting_app/UI/Map_Page/map_page_bloc.dart';
import 'package:location_detecting_app/UI/Components/NotificationCard.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Model.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Bloc.dart';



class MapPageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    MapPageBloc mapPageBloc = BlocProvider.of<MapPageBloc>(context);
  return Scaffold(
    appBar: AppBar(
      title: Text("Map",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.grey[100],
      elevation: 0,
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          Card(),
        ],
      ),
    ),
  );
  }
}