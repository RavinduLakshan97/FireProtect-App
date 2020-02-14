import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location_detecting_app/UI/LandingPage.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool _isObsecured = true;
  Color _eyeButtonColor = Colors.grey;

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'FireProject',
        style: TextStyle(fontSize: 42.0,
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
      },
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
            onPressed: () {
              if (_isObsecured) {
                setState(() {
                  _isObsecured = false;
                  _eyeButtonColor = Theme
                      .of(context)
                      .primaryColor;
                });
              }else{
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
        child: Text('Forgot Password?', style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),),

      ),
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height:50.0,
        width: 270.0,
        child: FlatButton(
          onPressed: (){
            if(_formKey.currentState.validate()){
              _formKey.currentState.save();
            }
            signIn();
          },
          color: Colors.green[700],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Text('LOGIN',style: Theme.of(context).primaryTextTheme.button,),
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


  Future <void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }catch(e){
          print(e.message);
      }
    }
  }

}
