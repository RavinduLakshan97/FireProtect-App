import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:location_detecting_app/Model/notification.dart';
import 'package:location_detecting_app/Util/constants.dart';
import 'package:location_detecting_app/Util/formatter.dart';

class NotificationCard extends StatelessWidget {
  final Notification notification;
  final Function tapEvent;
  final Function doubleTapEvent;

  NotificationCard({
    Key key,
    this.notification,
    this.tapEvent,
    this.doubleTapEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final customSnackBar = CustomSnackBar(scaffoldState: Scaffold.of(context));
    final dateStr = Formatter.getDateTime(notification.timeStamp);
    return Container(
      decoration: Constants.getCardBoxDecoration(Colors.white),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
//        onTap: () => tapEvent(dateStr),
        onDoubleTap: () => doubleTapEvent(dateStr),
        onLongPress: () async {
//          await Clipboard.setData(ClipboardData(text: notification.deviceName));
//          await Feedback.forLongPress(context);
//          customSnackBar.showSnackBar(
//            text: "පණිවුඩය copy කර ගන්නා ලදී",
//            duration: Duration(seconds: 2),
//          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                dateStr,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              HtmlWidget(
                Formatter.formatHTML("Temperature :"+" "+notification.temperature),
                textStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                bodyPadding: EdgeInsets.zero,
                enableCaching: false,
              ),
              Text(
                "Location :"+" "+notification.geoPoint,
                style: TextStyle(fontSize: 17.0, color: Colors.black),
              ),
              Text(
                "Device :"+" "+notification.deviceName,
                style: TextStyle(fontSize: 17.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
