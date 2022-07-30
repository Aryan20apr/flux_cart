import 'package:flutter/material.dart';
import 'welcome_image.dart';
import 'login_signup_button.dart';
import 'package:flux_cart/size_config.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static final String id = "welcome";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const WelcomeImage(),
          Row(
            children: <Widget>[
              Spacer(),
              Expanded(child: LoginAndSignupBtn(),flex:8),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
