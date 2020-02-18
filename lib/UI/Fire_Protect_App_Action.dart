import 'package:flutter/material.dart' hide Notification;
import 'package:location_detecting_app/Model/notification.dart';


@immutable
class FireProtectAppAction {}

class LoadNotificationAction implements FireProtectAppAction {}



class NotificationChangedAction implements FireProtectAppAction {
  final List<Notification> notifications;

  NotificationChangedAction(this.notifications);
}

