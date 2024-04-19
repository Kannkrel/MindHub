import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/error_emergency.dart';

Widget buttonEmergency(BuildContext context) {
  return InkWell(
    onTap: () {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ErrorEmergencyPage()),
            (route) => false);
        print("Botón 'EMERGENCIA' presionado después del retraso");
      });
    },
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
      child: const Center(
        child: Text(
          "EMERGENCIA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
