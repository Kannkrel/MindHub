import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/reg_emergency_page.dart';
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
                height: 80,
              ),
              Text(
                "Ingresa tu número de teléfono",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
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
              SizedBox(
                height: 15,
              ),
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
                    onTap: () async {
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuPage()), (route) => false);
                      setState(() {
                        _isSigningUp = true;
                      });
                      // Llama al método para actualizar el número de teléfono
                      User? user = await _auth.updatePhoneNumber(
                          context, _numberController.text);
                      setState(() {
                        _isSigningUp = false;
                      });
                      if (user != null) {
                        // Usuario actualizado correctamente, navega a la siguiente página
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegEmergencyPage()),
                            (route) => false);
                      }
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      child: Center(
                        child: _isSigningUp
                            ? CircularProgressIndicator(color: Colors.white)
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
