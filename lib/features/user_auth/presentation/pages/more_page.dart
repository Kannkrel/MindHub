import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/error_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/menu_page.dart';

class MorePage extends StatelessWidget {
  const MorePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(child: Text("Opciones", style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold))),

          const SizedBox(
          height: 20,
          ),
          InkWell(
            onTap: () {
              Future.delayed(Duration(milliseconds: 100), () {
              // Logica de botón
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Cuenta",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Future.delayed(Duration(milliseconds: 100), () {
                // Logica de botón
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Ajustes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Container(
              height: 3,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.10)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Future.delayed(Duration(milliseconds: 100), () {
                // Logica de botón
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Soporte",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Future.delayed(Duration(milliseconds: 100), () {
                // Logica de botón
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Acerca de...",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 3,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.10)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Future.delayed(Duration(milliseconds: 100), () {
                FirebaseAuth.instance.signOut();
                showSnackBar(context, 'Sesión cerrada correctamente');
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {return HomePage();},), (_) => false,);
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Cerrar Sesion",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

