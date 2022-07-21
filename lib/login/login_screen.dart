import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flux_cart/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'google_button.dart';

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
      // loading = true;
    });
    preferences = await SharedPreferences.getInstance();
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
    preferences = await SharedPreferences.getInstance();
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
          await preferences.setString('id', user!.uid);
          await preferences.setString('userName', user!.displayName ?? ' ');
          await preferences.setString('photoUrl', user!.photoURL ?? ' ');
          await preferences.setString('email', user!.email ?? '');
        } else {
          await preferences.setString('id', docs[0]['id']);
          await preferences.setString('userName', docs[0]['username']);
          await preferences.setString('photoUrl', docs[0]['photoUrl']);
          await preferences.setString('email', docs[0]['email']);
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
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: new Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 1,
      ),
      body: Stack(
        children: <Widget>[
          //GoogleSignInButton(googleAuth: signInWithGoogle(),),
          GoogleButton(),//------------------------------------------Google button
          Visibility(
            visible: loading ?? true,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          )
        ],
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
    onPressed: () async{
    // await signInWithGoogle();
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
    );
  }
}

