import 'package:flutter/material.dart';
import 'package:flux_cart/login/login_screen.dart';
class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                )
            ),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context,Login.id);

            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),

        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context,Login.id);
          },
          style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
              )
          ),
          ),
          child: Text(
            "Sign Up".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
