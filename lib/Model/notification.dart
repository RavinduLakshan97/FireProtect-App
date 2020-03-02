import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

class Notification extends DBModel{


  Timestamp timeStamp;
  String deviceName;
  String geoPoint;
  String temperature;

  Notification({DocumentReference ref, this.timeStamp,this.deviceName,this.geoPoint,this.temperature}):super(ref:ref);

  @override
  Notification clone() {
    return Notification(timeStamp: timeStamp,deviceName: deviceName, geoPoint: geoPoint,temperature: temperature);
  }

}