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
      }
    });
    
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.notifications),),
              Tab(icon: Icon(Icons.location_on),),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              Text('Notification Tab View'),
              Text('Location Tab View'),
            ],
          ),
        ),
      ),
    );
  }

}