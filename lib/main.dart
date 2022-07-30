import 'package:flutter/material.dart';
import 'package:flux_cart/login/login_screen.dart';
import 'package:flux_cart/screens/product_details.dart';
import 'package:flux_cart/welcome/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flux_cart/screens/shopping_cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flux_cart/login/login_screen.dart';
import 'package:flux_cart/welcome/welcome_screen.dart';
import 'signup/signup_ui.dart';
void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    initialRoute: WelcomeScreen.id,
    routes: {
      HomePage.id:(context)=>const Login(),
      Login.id:(context)=>const Login(),
      //ProductDetails.id:(context)=> ProductDetails(),
      Cart.id:(context)=>Cart(),
      WelcomeScreen.id:(context)=>const WelcomeScreen(),
      SignUp.id:(context)=>const SignUp()
  },
  ),
  );
}



