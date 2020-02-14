import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location_detecting_app/UI/loginpage.dart';

class Home extends StatefulWidget{

  const Home({
    Key key,
    this.user
  }) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  bool _isObsecured = true;


  @override
  Widget build(BuildContext context) {
    setState(() {
      if (_isObsecured) {
        setState(() {
          _isObsecured = false;

        });
      }else{
        setState(() {
          _isObsecured = true;
        });
      }    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }

}