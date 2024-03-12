import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/menu_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/start_diag_page.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "¡Oops!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/broken_heart_red.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Parece que ha habido un problema:(",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                "Inténtalo más tarde.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              InkWell(
                onTap: () {
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => StartDiag()), (route) => false);
                  });
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Regresar",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
