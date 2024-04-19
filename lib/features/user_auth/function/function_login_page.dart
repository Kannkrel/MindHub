import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/function/function_firebase.dart';
import 'package:indel_flutter/features/user_auth/function/function_snack_bar.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/menu_page.dart';

class FunctionLoginPage {
  static Future<void> signIn(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      Function setStateIsSigningTrue,
      Function setStateIsSigningFalse) async {
    setStateIsSigningTrue();

    try {
      FunctionSnackBar.hideCurrentSnackBar(context);

      String email = emailController.text;
      String password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        FunctionSnackBar.showSnackBar(context, 'Rellene todos los campos.');
      } else {
        if ((!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email))) {
          FunctionSnackBar.showSnackBar(
              context, 'Correo electrónico inválido.');
        } else {
          User? user = await FunctionFirebase.authFirebaseAuthService
              .signInWithEmailAndPassword(context, email, password);

          setStateIsSigningFalse();

          if (user != null) {
            print("Sesión iniciada corectamente");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
                (route) => false);
          } else {
            print("Ha ocurrido un error");
          }
        }
      }
    } catch (e) {
      print("Excepción: $e");
    } finally {
      setStateIsSigningFalse();
    }
  }
}
