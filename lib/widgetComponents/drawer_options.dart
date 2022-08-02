import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flux_cart/welcome/welcome_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
final GoogleSignIn googleSignIn = new GoogleSignIn();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
class DrawerOptions extends StatelessWidget {
  DrawerOptions({Key? key, required this.name, required this.icon,this.color=Colors.blueAccent,this.onTap})
      : super(key: key);
  String name;
  IconData icon;
  Color color;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //InkWell makes the list title clickable

      onTap: () async{
        if(name=='Logout')
          {
            print('Inside onTap and name is Logout');
            await firebaseAuth.signOut();
            await googleSignIn.signOut();
            Navigator.popAndPushNamed(context,WelcomeScreen.id);
          }
      },
      child: ListTile(
        title: Text('$name',style: TextStyle(fontSize: 17.0,),),
        leading: Icon(icon,color: color,),
      ),
    );
  }
}
