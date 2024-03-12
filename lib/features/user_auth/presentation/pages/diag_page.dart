import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/sign_up_page.dart';

class DiagPage extends StatelessWidget {
  const DiagPage({super.key});

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
              Image.asset(
                'assets/register_icon.png',
                width: 70,
                height: 70,
              ),
              SizedBox(height: 10),
              Text(
                "D.S.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              Text(
                "¿Te gustaría iniciar",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                "con tu diagnóstico?",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 200,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                      child: Center(
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
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())); // Lógica del botón "Registrarse"
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Center(
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
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  // Agrega un retraso de medio segundo (500 milisegundos) antes de ejecutar la lógica
                  Future.delayed(Duration(milliseconds: 500), () {
                    // Lógica del botón "EMERGENCIA"
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
                  child: Center(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
