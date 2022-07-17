import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
void main() {
  final ThemeData theme = ThemeData();
  runApp( MaterialApp(
    theme: theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: Colors.red,
        secondary: Colors.red
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white
        ),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.white,elevation: 20.0),
      listTileTheme: ListTileThemeData(textColor: Colors.black54,style: ListTileStyle.drawer,iconColor: Colors.grey,)

    ),

    debugShowCheckedModeBanner: false, //Hides the debug banner in top right
    home: HomePage(),
  ));
}



