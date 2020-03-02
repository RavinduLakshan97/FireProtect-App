import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:location_detecting_app/Model/notification.dart';
import 'package:location_detecting_app/Util/db_util.dart';

class NotificationRepository extends FirebaseRepository<Notification> {
  @override
  Notification fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    final data = snapshot.data;
    if (data == null) return null;
    return Notification(
        ref: snapshot.reference,
        timeStamp: data['timeStamp'] != null ? data['timeStamp'] : Timestamp.now(),
        deviceName: data['deviceName'] ?? "",
        geoPoint: data['geoPoint'] ?? "",
        temperature:data['temperature'] ?? "",
    );
  }

  @override
  Stream<List<Notification>> query({SpecificationI specification, String type, DocumentReference parent}) {
    return super.query(specification: specification, type: DBUtil.NOTIFICATION);
  }

  @override
  Map<String, dynamic> toMap(Notification item) {
    // TODO: implement toMap
    return null;
  }
}
