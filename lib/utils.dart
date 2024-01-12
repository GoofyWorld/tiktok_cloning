import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  String errorMessage = "Something went wrong";

  if (error is FirebaseException) {
    errorMessage = error.message ?? "Something went wrong";
  } else if (error is Error) {
    errorMessage = error.toString();
  } else if (error is Exception) {
    errorMessage = error.toString();
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(errorMessage),
    ),
  );
}
