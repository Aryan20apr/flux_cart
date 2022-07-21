import 'package:flutter/material.dart';
import 'package:flux_cart/login/login_screen.dart';
class GoogleSignInButton extends StatelessWidget {
  Future googleAuth;
   GoogleSignInButton({
    Key? key,required this.googleAuth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //-----------------Google Sign IN BUTTON
      onPressed: () async{

      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),

      child: Container(

        child: Row(
          children: const <Widget>[
            Image(

              image: AssetImage("images/google_logo.png"),
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in/Sign uo with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
