import 'package:flutter/material.dart';
import 'custom_colors.dart';

abstract class CustomThemes{

  CustomThemes._();

  static final lightTheme = ThemeData(
    primarySwatch: CustomColors.PRIMARY_COLOR,
    primaryColor: CustomColors.PRIMARY_COLOR,
    scaffoldBackgroundColor: CustomColors.BACKGROUND_COLOR,
    backgroundColor: CustomColors.BACKGROUND_COLOR,
    dialogBackgroundColor: CustomColors.BACKGROUND_COLOR,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: CustomColors.BACKGROUND_COLOR,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.blue),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(
        fontSize: 22,
        color: CustomColors.TITLE_COLOR,
        fontWeight: FontWeight.w500,
      ),
      body1: TextStyle(
        fontSize: 16,
        color: CustomColors.PRIMARY_TEXT_COLOR,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        color: Colors.blue,
        fontSize: 20,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: RadialGradient(
          colors: [
            Colors.white,
            CustomColors.TAB_BAR_BACKGROUND_COLOR,
          ],
        ),
      ),
      labelColor: Colors.orangeAccent,
      labelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelColor: Colors.grey,
    ),
    fontFamily: 'Montserrat',
  );

  static final darkTheme = null;

}