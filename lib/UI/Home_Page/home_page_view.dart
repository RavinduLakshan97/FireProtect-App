import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_detecting_app/Notification/firebaseNotification.dart';
import 'package:location_detecting_app/UI/Map_Page/map_page_view.dart';
import 'package:location_detecting_app/UI/Map_Page/map_page_bloc.dart';
import 'package:location_detecting_app/UI/Notification_Page/notification_page_view.dart';
import 'package:location_detecting_app/Util/custom_colors.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin<HomePage> {
  static final log = Log("HomePageView");
  final firebaseNotification = new FirebaseNotification();
  final tabNames = ["notifications", "map"];

  List<Widget> widgetOptions = [];
  TabController controller;

  @override
  void initState() {
    super.initState();
    firebaseNotification.firebaseCloudMessaging_Listeners();
    widgetOptions = [
      NotificationPageView(),

      BlocProvider<MapPageBloc>(
        create: (context) => MapPageBloc(context: context),
        child: MapPageView(),
      ),
    ];
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    controller.addListener(() {
    });
  }



  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notificationTab = Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.notifications_none, size: 18),
          Text(
            'Notifications',
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    final map = Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.map, size: 18),
          Text(
            'Map',
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );




    final tabBar = TabBar(
      controller: controller,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
      labelPadding: EdgeInsets.symmetric(horizontal: 4),
      tabs: [
        notificationTab,
        map,
      ],
    );

    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: widgetOptions,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: CustomColors.TAB_BAR_BACKGROUND_COLOR,
          border: Border(
            top: BorderSide(
              width: 1,
              color: CustomColors.darker(CustomColors.TAB_BAR_BACKGROUND_COLOR),
            ),
          ),
        ),
        child: SafeArea(
          child: tabBar,
        ),
      ),
    );
  }
}
