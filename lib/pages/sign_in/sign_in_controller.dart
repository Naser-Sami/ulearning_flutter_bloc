import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_flutter_bloc/common/widgets/flutter_toast.dart';

import '/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handelSignIn({required String type}) async {
    try {
      if (type == 'email') {
        // BlocProvider.of<SingInBloc>(context).state;
        final state = context.read<SignInBloc>().state;

        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          log("Email is >>> empty.");
          toastInfo(msg: "You need to fill email address");
          return;
        } else {
          log("Email is >>> $email");
        }

        if (password.isEmpty) {
          log("Password is >>> empty.");
          toastInfo(msg: "You need to fill password");
          return;
        } else {
          log("Password is >>> $password");
        }

        // FIREBASE AUTHENTICATION
        try {
          log("started try catch");

          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          log("credential assigned");

          // check if the user is a new user
          if (credential.user == null) {
            log("User does not exist.");
            toastInfo(msg: "User does not exist.");
            return;
          }

          // check if user is not verified
          if (!credential.user!.emailVerified) {
            log("Email does not verified.");
            toastInfo(msg: "Email does not verified.");
            return;
          }

          // CHECK FOR USER
          final user = credential.user;

          if (user != null) {
            /// User is verified from firebase
            log("User exist");
          } else {
            /// User is not verified
            log("User does not exist");
            toastInfo(msg: "User does not exist.");
            return;
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            log("No user found for that email.");
            toastInfo(msg: "No user found for that email.");
            return;
          } else if (e.code == "wrong-password") {
            log("Wrong password provided for that user.");
            toastInfo(msg: "Wrong password provided for that user.");
            return;
          } else if (e.code == "invalid-email") {
            log("Invalid email format.");
            toastInfo(msg: "Invalid email format.");
            return;
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
