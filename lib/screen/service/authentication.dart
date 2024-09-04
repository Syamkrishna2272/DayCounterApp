import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_counter/screen/homeScreen/goal_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


signinwithGoogle(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  
  // Show loading indicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      
      // Sign in to Firebase with the credential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      
      // Check if the user already exists in Firestore
      if (user != null) {
        final DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
        final DocumentSnapshot docSnapshot = await userDoc.get();
        
        if (!docSnapshot.exists) {
          // If the user does not exist, add their details to Firestore
          // print(user.u)
          await userDoc.set({
            'uid': user.uid,
            'name': user.displayName,
            'email': user.email,
            'photoURL': user.photoURL,
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }
      
      // Dismiss the loading indicator
      Navigator.of(context).pop();
      
      // Navigate to the GoalCounterScreen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const GoalCounterScreen()),
        (Route<dynamic> route) => false,
      );
    }
  } catch (e) {
    // Dismiss the loading indicator on error
    Navigator.of(context).pop();
    
    print(e);
  }
}
