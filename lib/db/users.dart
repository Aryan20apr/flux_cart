import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices
{
  FirebaseFirestore _database=FirebaseFirestore.instance;
  createUser(UserCredential userCredential,String gender,String name) async
  {print('Inside Create users');
    User? user=userCredential.user;
    await _database.collection('Users_Collection').doc(user?.uid).set({
      'Name':name,
      'Email':user?.email,
      'Photo':user?.photoURL,
      'Phone Number':user?.phoneNumber,
      'Gender':gender
    });
  }
}