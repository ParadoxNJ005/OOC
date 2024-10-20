import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AUTH {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // SignUp Function
  Future<String?> signUp(String name, String email, String password, String number) async {
    try {
      // Create a user with email and password in Firebase Auth
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user's UID
      String uid = userCredential.user!.uid;

      // Upload user data (name, email, number) to Firestore
      await firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'number': number, // Added number to Firestore document
        'createdAt': Timestamp.now(), // Optionally store when the user was created
      });

      return "Success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return "Email Already Exists";
        case 'invalid-email':
          return "Invalid Email Address";
        case 'weak-password':
          return "Please Choose a Stronger Password";
        default:
          return "An Undefined Error Occurred: ${e.message}";
      }
    } catch (e) {
      return "Failed to upload user data to Firestore: $e";
    }
  }

  // SignIn Function
  Future<bool> signIn(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          showErrSnackbar(context, "Please Enter a Valid Email");
          break;
        case 'wrong-password':
          showErrSnackbar(context, "Wrong Password");
          break;
        case 'user-not-found':
          showErrSnackbar(context, "User Not Found");
          break;
        case 'user-disabled':
          showErrSnackbar(context, "This User is Disabled");
          break;
        case 'too-many-requests':
          showErrSnackbar(context, "Too Many Requests. Please Try Again Later.");
          break;
        case 'operation-not-allowed':
          showErrSnackbar(context, "This Operation is Not Allowed");
          break;
        default:
          showErrSnackbar(context, "An Undefined Error Occurred: ${e.message}");
      }
    }
    return Future.value(false);
  }

  // Function to show snackbar instead of a dialog
  void showErrSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent, // Customize the snackbar color
        duration: const Duration(seconds: 3), // Snackbar visibility duration
      ),
    );
  }
}
