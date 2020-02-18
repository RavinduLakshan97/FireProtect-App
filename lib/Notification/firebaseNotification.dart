import 'dart:io';

import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification {
  static final log = Log("FirebaseNotification");
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token) {
      log.d("FCM: $token}");
    });
    _firebaseMessaging.subscribeToTopic("user");

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        log.d('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        log.d('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        log.d('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      log.d("Settings registered: $settings");
    });
  }
}
