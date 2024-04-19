import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/menu_page.dart';

Widget buttonLogin(BuildContext context) {
  return InkWell(
    onTap: () {
      Future.delayed(const Duration(milliseconds: 100), () {
        final FirebaseAuth auth = FirebaseAuth.instance;

        final User? user = auth.currentUser;
        if (user != null) {
          print('Already logged in: ${user.email}');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
              (route) => false);
        } else {
          print('Not logged in');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
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
