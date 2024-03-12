import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/error_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/menu_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/start_diag_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();



  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              SizedBox(height: 80),

              Image.asset(
                'assets/user_icon_green.png',
                width: 120,
                height: 120,
              ),
              SizedBox(height: 20),
              Text(
                "Inicio de Sesión",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Text(
                "Ingresa los datos de tu cuenta",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextField(
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
                height: 30,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  _signIn();
                },
                child: Container(
                  width: double.infinity,
                  height: 57,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(7, 185, 159, 1),
                  ),
                  child: Center(
                    child:_isSigning ? CircularProgressIndicator(color: Colors.white) : Text(
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
              SizedBox(
                height: 20,
              ),
              Text(
                "¿Aún no tienes cuenta?",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black45
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  "Regístrate",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(7, 185, 159, 10)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {

    setState(() {
      _isSigning = true;
    });

    try {
      hideCurrentSnackBar(context);

    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showSnackBar(context, 'Rellene todos los campos.');
    } else {
      if ((!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email))) {
        showSnackBar(context, 'Correo electrónico inválido.');
      } else {
        User? user = await _auth.signInWithEmailAndPassword(context, email, password);
        setState(() {
          _isSigning = false;
        });

        if (user!= null) {
          print("Sesión iniciada corectamente");
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuPage()), (route) => false);
        }
        else{
          print("Ha ocurrido un error");
        }
      }
    }

    } catch (e) {
      print("Excepción: $e");
    } finally {
      setState(() {
        _isSigning = false;
      });
    }




  }

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
