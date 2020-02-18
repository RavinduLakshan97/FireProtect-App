import 'package:flutter/material.dart' hide Notification;
import 'package:location_detecting_app/Model/notification.dart';

class FireProtectAppModel {
  List<Notification> notificationlist;

  FireProtectAppModel({
    @required this.notificationlist,
  });

  FireProtectAppModel clone() {
    return FireProtectAppModel(
      notificationlist: notificationlist,
    );
  }
}
