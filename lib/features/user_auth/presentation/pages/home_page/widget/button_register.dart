import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/sign_up_page.dart';

Widget buttonRegiester(BuildContext context) {
  return InkWell(
    onTap: () {
      Future.delayed(const Duration(milliseconds: 100), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpPage()));
      });
    },
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: const Center(
        child: Text(
          "Registrarse",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
