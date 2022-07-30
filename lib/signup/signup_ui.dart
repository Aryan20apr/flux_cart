import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flux_cart/login/login_screen.dart';
import 'package:flux_cart/screens/home_screen.dart';
import 'reg_form.dart';
import 'auth_logic.dart';

class SignUp extends StatefulWidget {
  static String id = 'register';
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  static final _formKey=GlobalKey<FormState>();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _nameTextController=TextEditingController();
  TextEditingController _confirmPasswordController=TextEditingController();
  String gender='Gender';
  String phNo='';
  bool hidePassword=true;
  String groupValue = 'Male';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, //Prevents bottom overflow on opening keyboard
        /* appBar: AppBar(

          centerTitle: true,
          title: new Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          elevation: 1,
        ),*/
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const <Widget>[
                        SizedBox(
                            height: 30 //MediaQuery.of(context).size.height,
                            ),
                        Text(
                          "Welcome",
                          style: TextStyle(fontSize: 50),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Register to continue',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(

                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(1),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                            vertical:
                                MediaQuery.of(context).size.height * 0.05),
                        child: //RegisterationForm(),
                        Form(
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
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003,
                      ),
                      Column(
                        children: [
                          Text('Gneder',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700),),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListTile(
                                      title: Text(
                                        'Male',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Radio(
                                          value: "Male",
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChanged(e!)))),
                              Expanded(
                                  child: ListTile(
                                      title: Text(
                                        'Male',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Radio(
                                          value: "Female",
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChanged(e!))))
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          primary: Colors.purple,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                      validate();
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                /*Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
                  child: Row(
                      children:  const <Widget>[
                        Expanded(
                            child: Divider(
                              color: Colors.black,
                              height: 2.0,
                              thickness: 1.0,
                            )
                        ),

                        Text("OR",style: TextStyle(color: Colors.black),),

                        Expanded(
                            child: Divider(
                              color: Colors.black,
                              height: 2.0,
                              thickness: 1.0,
                            )
                        ),

                        //------------------------------------------Google button


                      ]
                  ),
                ),*/

                //GoogleSignInButton(googleAuth: signInWithGoogle(),),
                /*SizedBox(height: MediaQuery.of(context).size.height*0.05),
                GoogleButton(),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, Login.id);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Visibility(
                  visible: loading ?? true,
                  child: Center(
                    child: Container(
                      color: Colors.white.withOpacity(0.7),
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  valueChanged(String e) {
    setState(() {
      if (e == 'Male') {
        groupValue = e;
      } else if (e == "Female") {
        groupValue = e;
      }
    });
  }
  void validate()
  {
    FormState? formState=_formKey.currentState;
    if(formState!.validate())
      {

      }

  }
}


/*
class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //-----------------Google Sign IN BUTTON
      onPressed: () async {
        // await signInWithGoogle();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Image(
            image: AssetImage("images/google_logo.png"),
            height: 35.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}


*/
