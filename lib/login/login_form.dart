import 'package:flutter/material.dart';
import 'package:flux_cart/size_config.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}
final _formKey=  GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {
  TextEditingController? _emailTextController=TextEditingController();
  TextEditingController? _passwordTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Form(
    key: _formKey,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _passwordTextController,
            decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlineInputBorder().,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.email),
                )
              // isDense:true
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex =
                new RegExp(pattern.toString());
                if (!regex.hasMatch(value))
                  return 'Please make sure your email address is valid';
                else
                  return null;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4),
          child: TextFormField(
            controller: _emailTextController,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              // labelText: "Email*",
                hintText: "Email",
                // border: OutlineInputBorder().,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.email,),
                )
              // isDense:true
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex =
                new RegExp(pattern.toString());
                if (!regex.hasMatch(value))
                  return 'Please make sure your email address is valid';
                else
                  return null;
              }
            },
          ),
        ),
        SizedBox(
          height:
          MediaQuery.of(context).size.height * 0.05,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _passwordTextController,
            decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlineInputBorder().,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.email),
                )
              // isDense:true
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex =
                new RegExp(pattern.toString());
                if (!regex.hasMatch(value))
                  return 'Please make sure your email address is valid';
                else
                  return null;
              }
            },
          ),
        ),
      ],
    ),
    );
  }
}
