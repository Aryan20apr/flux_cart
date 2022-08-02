import 'package:flutter/material.dart';
import 'package:flux_cart/screens/home_screen.dart';
import 'package:flux_cart/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}
final _formKey=  GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {
  TextEditingController? _emailTextController = TextEditingController();
  TextEditingController? _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(
                  hintText: "Email",
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
              controller: _passwordTextController,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  // labelText: "Email*",
                  hintText: "Password",
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
            MediaQuery
                .of(context)
                .size
                .height * 0.05,
          ),

          /*Padding(
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
        ),*/
          ElevatedButton(

            style: ElevatedButton.styleFrom(padding: EdgeInsets
                .symmetric(horizontal: 50, vertical: 10),
              primary: Colors.purple,
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),),
            onPressed: () {
              signInWithEmail();
            },
            child: Text(
              "Login".toUpperCase(),
              style: TextStyle(fontSize: MediaQuery
                  .of(context)
                  .textScaleFactor * 20),
            ),
          ),

        ],


      ),
    );
  }

  Future signInWithEmail() async
  {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController!.text ?? '',
        password: _passwordTextController!.text ?? '',
      );
      Navigator.popAndPushNamed(context, HomePage.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    catch (e) {
      print("Error in email login $e");
    }
  }
}