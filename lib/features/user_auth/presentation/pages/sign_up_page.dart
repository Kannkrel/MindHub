import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:indel_flutter/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/reg_number_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/start_diag_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSigningUp = false;
  bool _isAssociateAccount = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _specializationController = TextEditingController(); // Nuevo TextEditingController

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _specializationController.dispose(); // Dispose del TextEditingController de la especialización
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
                height: 20,
              ),
              Image.asset(
                'assets/register_icon.png',
                width: 90,
                height: 90,
              ),
              SizedBox(height: 10),
              Text(
                "Registro",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              Text(
                "Llena los campos necesarios",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingrese su nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Ingrese su apellido',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                height: 15,
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
                height: 15,
              ),
              CheckboxListTile(
                title: Text("Cuenta de Asociado"),
                value: _isAssociateAccount,
                onChanged: (newValue) {
                  setState(() {
                    _isAssociateAccount = newValue!;
                  });
                },
              ),
              if (_isAssociateAccount) ...[
                SizedBox(height: 15),
                TextField(
                  controller: _specializationController,
                  decoration: InputDecoration(
                    labelText: 'Especialización',
                    hintText: 'Ingrese su especialización',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Future.delayed(Duration(milliseconds: 100), () {
                    _signUp();
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
                      height: 55,
                      child: Center(
                        child: _isSigningUp
                            ? CircularProgressIndicator(
                            color: Colors.white)
                            : Text(
                          "Registrarse",
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

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });

    try {
      hideCurrentSnackBar(context);

      String name = _nameController.text;
      String lastname = _lastnameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String specialization = _specializationController.text; // Obtener el valor de la especialización

      if (name.isEmpty ||
          lastname.isEmpty ||
          email.isEmpty ||
          password.isEmpty) {
        showSnackBar(context, 'Rellene todos los campos.');
      } else {
        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
          showSnackBar(context, 'Correo electrónico inválido.');
        } else {
          if (password.length < 6) {
            showSnackBar(
                context, 'La contraseña debe tener al menos 6 carácteres.');
          } else {
            User? user = await _auth.signUpWithEmailAndPassword(
              context,
              email,
              password,
              _nameController,
              _lastnameController,
              _emailController,
              _isAssociateAccount,
              specialization: specialization, // Pasar la especialización al método de registro
            );

            setState(() {
              _isSigningUp = false;
            });

            if (user != null) {
              print("Cuenta creada correctamente");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => RegNumberPage()),
                      (route) => false);
            } else {
              print("Ha ocurrido un error.");
            }
          }
        }
      }
    } catch (e) {
      print("Excepción: $e");
    } finally {
      setState(() {
        _isSigningUp = false;
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
