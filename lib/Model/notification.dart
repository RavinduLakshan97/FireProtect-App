import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

class Notification extends DBModel{

  String title;
  GeoPoint cordinate;

  Notification({DocumentReference ref, this.title,this.cordinate}):super(ref:ref);

  @override
  Notification clone() {
    return Notification(title: title, cordinate: cordinate);
  }

}