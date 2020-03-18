import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location_detecting_app/UI/Home_Page/home_page_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  void initState() {
    firebaseMessaging.configure(onLaunch: (Map<String, dynamic> msg) {
      print("onLaunch Called");
    }, onResume: (Map<String, dynamic> msg) {
      print("onResume Called");
    }, onMessage: (Map<String, dynamic> msg) {
      print("onMessage Called");
    });
    firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
        sound: true,
        alert: true,
        badge: true,
      )
    );
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings){
      print("IOS Settings Registered");
    }
    );
    firebaseMessaging.getToken().then((token){
      update(token);
    });
  }

  update(String token){
//    print(token);
//    textValue=token;
  DatabaseReference databaseReference = new FirebaseDatabase().reference();
  databaseReference.child('fcm-token/${token}').set({"token" : token});
    setState(() {

    });
  }

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String _email;
  String _password;
  bool _isObsecured = true;
  Color _eyeButtonColor = Colors.grey;

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'FireProtect',
        style: TextStyle(
          fontSize: 42.0,
          color: Colors.blue,
        ),
      ),
    );
  }

  Padding buildTitleLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 170.0,
          height: 1.5,
          color: Colors.blue,
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      onSaved: (emailInput) => _email = emailInput,
      validator: (emailinput) {
        if (emailinput.isEmpty) {
          return 'Please enter an email';
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Email Address'),
    );
  }

  TextFormField buildPasswordInput(BuildContext context) {
    return TextFormField(
      onSaved: (passwordInput) => _password = passwordInput,
      validator: (passwordInput) {
        if (passwordInput.isEmpty) {
          return 'please enter a password';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
            onPressed: () {
              if (_isObsecured) {
                setState(() {
                  _isObsecured = false;
                  _eyeButtonColor = Theme.of(context).primaryColor;
                });
              } else {
                setState(() {
                  _isObsecured = true;
                  _eyeButtonColor = Colors.grey;
                });
              }
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeButtonColor,
            )),
      ),
      obscureText: _isObsecured,
    );
  }

  Padding buildPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot Password?',
          style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
        ),
      ),
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 50.0,
        width: 270.0,
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
            }
            signIn();
          },
          color: Colors.green[700],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Text(
            'LOGIN',
            style: Theme.of(context).primaryTextTheme.button,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 22.0),
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight,
            ),
            buildTitle(),
            buildTitleLine(),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 70.0,
            ),
            buildEmailTextField(),
            SizedBox(
              height: 30.0,
            ),
            buildPasswordInput(context),
            buildPasswordText(),
            SizedBox(
              height: 20.0,
            ),
            buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
//          await Dialogs.showLoadingDialog(context, _keyLoader);//invoking login
        await Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
