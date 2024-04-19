import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/function/function_firebase.dart';
import 'package:indel_flutter/features/user_auth/function/function_home_page.dart';

Widget buttonLogin(BuildContext context) {
  return InkWell(
    onTap: () {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (FunctionFirebase.user != null) {
          FunctionHomePage.navigateToHomePage(context);
        } else {
          FunctionHomePage.navigateToLoginPage(context);
        }
      });
    },
    child: Ink(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(7, 185, 159, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 50,
          child: const Center(
            child: Text(
              "Iniciar Sesión",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
