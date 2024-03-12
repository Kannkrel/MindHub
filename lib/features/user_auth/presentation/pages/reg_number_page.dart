import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/start_diag_page.dart';

import 'menu_page.dart';

class RegNumberPage extends StatefulWidget {
  const RegNumberPage({super.key});

  @override
  State<RegNumberPage> createState() => _RegNumberPageState();
}

class _RegNumberPageState extends State<RegNumberPage> {
  bool _isSigningUp = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emergencynumberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    _emergencynumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/register_icon.png',
                width: 90,
                height: 90,
              ),
              SizedBox(height: 10),
              Text(
                "¡Tu cuenta se ha creado!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              Text(
                "Necesitamos un par de datos extra...",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número de teléfono',
                  hintText: 'Ingrese su número',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emergencynumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número de emergencia',
                  hintText: 'Ingrese un número',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Entrada de texto para el correo
              /**TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  hintText: 'Ingrese su correo electrónico',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Entrada de texto para la contraseña
              TextField(
                controller: _passwordController,
                obscureText: true, // Para ocultar la contraseña
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),*/
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Future.delayed(Duration(milliseconds: 100), () {
                    // _RegNumber();
                  });
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuPage()), (route) => false);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      child: Center(
                        child: _isSigningUp
                            ? CircularProgressIndicator(
                            color: Colors.white)
                            : Text(
                          "Siguiente",
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
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*

  void _RegNumber() async {
    /* setState(() {
      _isSigningUp = true;
    }); */

    try {
      hideCurrentSnackBar(context);

      String name = _numberController.text;
      String lastname = _emergencynumberController.text;

      // Validar que todos los campos estén llenos
      if (name.isEmpty || lastname.isEmpty) {
        showSnackBar(context, 'Rellene todos los campos.');
      } else {
        User? user = await _auth.registerNumber(
          context,
          _numberController,
          _emergencynumberController,
        );

        setState(() {
          _isSigningUp = false;
        });

        if (user != null) {
          print("Cuenta creada correctamente");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => StartDiag()),
                  (route) => false);
        } else {
          print("Ha ocurrido un error.");
        }
      }
    } catch (e) {
      // Se produjo una excepción debido a las validaciones
      print("Excepción: $e");
    } finally {
      setState(() {
        _isSigningUp = false;
      });
    }
  }

   */

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void hideCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

}

