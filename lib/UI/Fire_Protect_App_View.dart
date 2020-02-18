import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Bloc.dart';
import 'package:location_detecting_app/UI/Home_Page/home_page_view.dart';

//import 'home_page/home_page_view.dart';

class FireProtectAppView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider<FireProtectAppBloc>(
      create: (context) => FireProtectAppBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FireProtect',
        home: HomePage(),
      ),
    );
  }
}
