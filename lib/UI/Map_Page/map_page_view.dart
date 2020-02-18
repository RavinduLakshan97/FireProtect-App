import 'package:flutter/material.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_detecting_app/UI/Components/NotificationCard.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Model.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Bloc.dart';

class MapPageView extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapPageView> {

  final log = Log("Loading Map Tab");
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        controller: controller,
        child: BlocBuilder<FireProtectAppBloc, FireProtectAppModel>(
          builder: (context, state) {
            return Column(
//              children: state.notificationlist
//                  .map((note) => NotificationCard(
//                notification: note,
//              )
//              )
//                  .toList(growable: false),
            );
          },
        ),
      ),
    );
  }


}
