import 'package:chat_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Service {
  final auth = FirebaseAuth.instance;

  void createUser(context, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()))
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void loginUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()))
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void signOut(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      errorBox(context, e);
    }
  }

  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Eror"),
            content: Text(e.toString()),
          );
        });
  }
}
