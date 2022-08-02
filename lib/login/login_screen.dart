import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flux_cart/screens/home_screen.dart';
import 'package:flux_cart/signup/signup_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'google_button.dart';
import 'login_form.dart';
import 'package:flux_cart/size_config.dart';
class Login extends StatefulWidget {
  static final String id = 'login_screen';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;
  User? user;
  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
       loading = true;
    });
    User user=await firebaseAuth.currentUser!;
    if(user!=null)
      {
        setState(()
            {
              loading=false;
            }
        );
      }
    //preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn(); //Check if user is signed in

    if (isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage())); //Helps us to keep user logged in once he has logged in so that user doesn't come to log in screen again on pressing back.
      setState(() {
        loading = false;
      });
    }
  }

  Future signInWithGoogle() async {
    //preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      user = userCredential.user;
      if (user != null) {
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection("users")
            .where("id", isEqualTo: user?.uid)
            .get();
        //Check whether the id of that field is equal to the id of the user we obtained above.
        //If we have it, it means the user is already signed up to the application.
        final List<DocumentSnapshot> docs = result.docs;
        if (docs.length ==
            0) //If the docs are empty means that user does not exist in our database, therfore sign hom up
        {
          //Add user to our collection
          FirebaseFirestore.instance.collection("users").doc(user?.uid).set({
            "id": user?.uid,
            "username": user?.displayName,
            "profilePicture": user?.photoURL,
            "phNo": user?.phoneNumber,
            "email": user?.email,
          });
         /* await preferences.setString('id', user!.uid);
          await preferences.setString('userName', user!.displayName ?? ' ');
          await preferences.setString('photoUrl', user!.photoURL ?? ' ');
          await preferences.setString('email', user!.email ?? '');*/
        } else {
          /*await preferences.setString('id', docs[0]['id']);
          await preferences.setString('userName', docs[0]['username']);
          await preferences.setString('photoUrl', docs[0]['photoUrl']);
          await preferences.setString('email', docs[0]['email']);*/
        }
        Navigator.popAndPushNamed(context, HomePage.id);
        setState(() {
          loading = false;
        });
      } else {}

      /* try {
        final UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }*/
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(

        resizeToAvoidBottomInset: false,//Prevents bottom overflow on opening keyboard
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
                            height: 50//MediaQuery.of(context).size.height,
                          ),
                          Text(
                            "Welcome",
                            style: TextStyle(fontSize: 50),

                          ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Login with email or Google',
                        style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height*0.1),
                 Container(
                   padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02),
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, ),
                     decoration: const BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.all(
                           Radius.circular(20.0))
                         ),
                   child: Column(
                     children: [
                       Padding(
                         padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth!*0.05,vertical: MediaQuery.of(context).size.height*0.05 ),
                         child: LoginForm(),
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height*0.02,
                       ),
                       ElevatedButton(

                         style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),primary: Colors.purple,elevation: 2.0,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),),
                         onPressed: () {},
                         child: Text(
                           "Login".toUpperCase(),
                           style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*20),
                         ),
                       ),

                     ],

                   ),
                 ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
                  child: Row(
                      children:  <Widget>[
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
                ),

                //GoogleSignInButton(googleAuth: signInWithGoogle(),),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                // GoogleButton(),
        ElevatedButton(
          //-----------------Google Sign IN BUTTON
          onPressed: () async {
            await signInWithGoogle();
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
        ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()
                    {
                        Navigator.popAndPushNamed(context, SignUp.id);
                    },
                    child: Text("Sign up",style: TextStyle(color:Colors.red),),
                  ),
                )
      ]
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
        ),
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //-----------------Google Sign IN BUTTON
      onPressed: () async {
         //await signInWithGoogle();
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
