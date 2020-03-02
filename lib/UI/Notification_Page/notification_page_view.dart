import 'package:flutter/material.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_detecting_app/UI/Components/NotificationCard.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Model.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Bloc.dart';
import 'package:location_detecting_app/Util/custom_colors.dart';

class NotificationPageView extends StatefulWidget {

  @override
  _NotifyListState createState() => _NotifyListState();
}

class _NotifyListState extends State<NotificationPageView> {

  final log = Log("Loading Notifiction Tab");
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: CustomColors.APP_BAR_COLOR,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        controller: controller,
        child: BlocBuilder<FireProtectAppBloc, FireProtectAppModel>(
          builder: (context, state) {
            return Column(
              children: state.notificationlist
                  .map((note) => NotificationCard(
                notification: note,
              )
              ).toList(growable: false),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() => [
      controller.position.maxScrollExtent,
      controller.position.minScrollExtent,
      (controller.position.maxScrollExtent + controller.position.minScrollExtent) / 2
    ].contains(controller.offset));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
