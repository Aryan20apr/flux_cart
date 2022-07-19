import 'package:flutter/material.dart';
import 'package:flux_cart/screens/product_details.dart';
import 'screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flux_cart/screens/shopping_cart.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
    initialRoute: HomePage.id,
    routes: {
      HomePage.id:(context)=>const HomePage(),
      //ProductDetails.id:(context)=> ProductDetails(),
      Cart.id:(context)=>Cart()
  },
  ),
  );
}



