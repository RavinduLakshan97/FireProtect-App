import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/services.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:location_detecting_app/Model/notification.dart';
//import 'package:path_to_nibbana/ui/components/custom_snack_bar.dart';
//import 'package:path_to_nibbana/util/constants.dart';
//import 'package:path_to_nibbana/util/formatter.dart';

class NotificationCard extends StatelessWidget {
  final Notification notification;


  NotificationCard({
    Key key,
    this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final customSnackBar = CustomSnackBar(scaffoldState: Scaffold.of(context));
//    final dateStr = Formatter.getDateTime(notification.timeStamp);
    return Container(
//      decoration: Constants.getCardBoxDecoration(Colors.white),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
//        onTap: (),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
//              Text(
//                dateStr,
//                style: TextStyle(
//                  fontSize: 14.0,
//                  fontWeight: FontWeight.w300,
//                  color: Colors.grey[600],
//                ),
//              ),
              SizedBox(
                height: 10.0,
              ),
//              HtmlWidget(
//                Formatter.formatHTML(notification.description),
//                textStyle: TextStyle(fontSize: 17.0, color: Colors.black),
//                bodyPadding: EdgeInsets.zero,
//                enableCaching: false,
//              ),
//              Text(
//                notification.user,
//                style: TextStyle(fontSize: 17.0, color: Colors.black),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
