import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Bloc.dart';
import 'package:location_detecting_app/UI/Map_Page/map_page_action.dart';
import 'package:location_detecting_app/UI/Map_Page/map_page_model.dart';

class MapPageBloc extends Bloc<MapPageAction,MapPageModel>{
  MapPageBloc({@required context}) : fireProtectAppBloc = BlocProvider.of<FireProtectAppBloc>(context);

  final FireProtectAppBloc fireProtectAppBloc;


  @override
  get initialState => null;


  @override
  Stream <MapPageModel> mapEventToState(event) {
    // TODO: implement mapEventToState
    return null;
  }

}