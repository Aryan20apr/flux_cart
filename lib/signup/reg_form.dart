import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class RegisterationForm extends StatefulWidget {
  const RegisterationForm({Key? key}) : super(key: key);

  @override
  State<RegisterationForm> createState() => _RegisterationFormState();

}

class _RegisterationFormState extends State<RegisterationForm> {
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  static final _formKey=GlobalKey<FormState>();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _nameTextController=TextEditingController();
  TextEditingController _confirmPasswordController=TextEditingController();
  String gender='Gender';
  String phNo='';
  bool hidePassword=true;

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameTextController,
              decoration: const InputDecoration(
                  hintText: "Full Name",
                  hintStyle: TextStyle(color: Colors.white),
                  // border: OutlineInputBorder().,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.person),
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
                  hintStyle: TextStyle(color: Colors.white),
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
        /*  SizedBox(
            height:
            MediaQuery.of(context).size.height * 0.05,
          ),*/
          Padding(
            padding: EdgeInsets.all(4.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordTextController,
              decoration: InputDecoration(

                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  // border: OutlineInputBorder().,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.password),
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
                else if(value.length<6)
                {
                  return 'The password should be at least 6 characters long';
                }
              },

            ),

          ),
          /*SizedBox(
            height:
            MediaQuery.of(context).size.height * 0.05,
          ),*/
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              trailing: IconButton(icon:Icon(Icons.remove_red_eye_rounded),onPressed: (){
                hidePassword=!(hidePassword);
              },),
              title: TextFormField(
                obscureText: hidePassword,
                controller: _confirmPasswordController,
                decoration: const InputDecoration(

                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.white),
                    // border: OutlineInputBorder().,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.password),
                    )
                  // isDense:true
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex =
                    new RegExp(pattern.toString());
                    if (!regex.hasMatch(value)) {
                      return 'Please make sure your email address or password is valid';
                    } else {
                      return null;
                    }
                  }
                  else if(value.length<6)
                    {
                      return 'The password should be at least 6 characters long';
                    }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}
